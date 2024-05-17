import 'dart:convert';

import 'package:get/get.dart';
import 'package:tutorials_world/models/video_model.dart';
import 'package:tutorials_world/secret_keys.dart';
import 'package:http/http.dart' as http;

class YoutubeApiController extends GetxController {
  final String baseUrl = 'www.googleapis.com';
  final String apiKey = youtubeAPIKey;
  String nextPageToken = '';
  String maxResults = '8';

  Future<Video> fetchVideoWithVideoID({required String videoId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'id': videoId,
      'key': apiKey,
    };
    Uri uri = Uri.https(
      baseUrl,
      '/youtube/v3/videos',
      parameters,
    );
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<dynamic> videoJson = data['items'];
      late Video video;
      for (var json in videoJson) {
        video = Video.fromMap(json, nextPageToken, true);
      }
      return video;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
