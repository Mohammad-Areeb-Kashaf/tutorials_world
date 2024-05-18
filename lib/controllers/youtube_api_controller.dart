import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tutorials_world/controllers/network_controller.dart';
import 'package:tutorials_world/models/playlist_model.dart';
import 'package:tutorials_world/models/video_model.dart';
import 'package:tutorials_world/secret_keys.dart';

class YoutubeApiController extends GetxController {
  final networkController = Get.find<NetworkController>();
  final String _baseUrl = 'www.googleapis.com';
  static String nextPageToken = '';
  static String maxResults = '8';
  final String apiKey = youtubeAPIKey;

  var playlists = <String, List<Playlist>>{}.obs;
  var videos = <String, Video>{}.obs;
  var playlistVideos = <Video>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    List<String> playlistIDs = [
      "PLu0W_9lII9agICnT8t4iYVSZ3eykIAOME",
      "PLu0W_9lII9ah7DDtYtflgwMwpT3xmjXY9",
      "PLu0W_9lII9ajLcqRcj4PoEihkukF_OTzA",
      "PLzOt3noWLMthRRVGsvhHaF0W_9Zif3ahQ",
      "PLzOt3noWLMthXqy_sRRzd15bptcGIKCF0",
      "PLzOt3noWLMthJKm8SJl2zmUlJiZp7fzo7",
      "PLzOt3noWLMtiX8unvZ_IryZDbD7qZ3nix",
      "PLzOt3noWLMtjI12lI5KA9pVGCtqmTBjj5",
    ];
    List<String> videoIDs = [
      'ER9SspLe4Hg',
      'Q4p8vRQX8uY',
    ];

    for (var videoID in videoIDs) {
      fetchVideoWithVideoID(videoId: videoID);
    }

    for (var playlistID in playlistIDs) {
      fetchPlaylistWithPlaylistID(playlistId: playlistID);
    }
  }

  Future<void> fetchVideoWithVideoID({required String videoId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'id': videoId,
      'key': apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/videos',
      parameters,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> videoJson = data['items'];
        late Video video;
        for (var json in videoJson) {
          video = Video.fromMap(json, nextPageToken, true);
        }
        videos[videoId] = video;
      } else {
        throw json.decode(response.body)['error']['message'];
      }
    } catch (e) {
      networkController.checkInternet();
      rethrow;
    }
  }

  Future<void> fetchPlaylistWithPlaylistID({required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails',
      'id': playlistId,
      'maxResults': maxResults,
      'pageToken': nextPageToken,
      'key': apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlists',
      parameters,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        nextPageToken = data['nextPageToken'] ?? '';
        List<dynamic> playlistJson = data['items'];
        List<Playlist> fetchedPlaylists = [];

        for (var json in playlistJson) {
          fetchedPlaylists.add(Playlist.fromMap(json));
        }
        playlists[playlistId] = fetchedPlaylists;
      } else {
        throw json.decode(response.body)['error']['message'];
      }
    } catch (e) {
      networkController.checkInternet();
      rethrow;
    }
  }

  Future<void> fetchVideosFromPlaylist({required String playlistId}) async {
    isLoading.value = true;
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': maxResults,
      'pageToken': nextPageToken,
      'key': apiKey,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        nextPageToken = data['nextPageToken'] ?? '';
        List<dynamic> videosJson = data['items'];
        List<Video> fetchedVideos = [];

        for (var json in videosJson) {
          fetchedVideos
              .add(Video.fromMap(json['snippet'], nextPageToken, false));
        }
        playlistVideos.addAll(fetchedVideos);
      } else {
        throw json.decode(response.body)['error']['message'];
      }
    } catch (e) {
      networkController.checkInternet();
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void resetNextPageToken() {
    nextPageToken = '';
  }
}
