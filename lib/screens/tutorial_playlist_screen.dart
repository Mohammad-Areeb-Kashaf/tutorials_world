import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/controllers/youtube_api_controller.dart';
import 'package:tutorials_world/widgets/header_widget.dart';
import 'package:tutorials_world/widgets/internet_checker.dart';

class TutorialPlaylistScreen extends StatefulWidget {
  const TutorialPlaylistScreen({super.key});

  @override
  State<TutorialPlaylistScreen> createState() => _TutorialPlaylistScreenState();
}

class _TutorialPlaylistScreenState extends State<TutorialPlaylistScreen> {
  final youtubeApiController = Get.find<YoutubeApiController>();
  String? id;
  Future<void>? fetchData;

  @override
  void initState() {
    super.initState();
    id = Get.parameters['id'];
    if (id != null) {
      fetchData = getData();
    } else {}
  }

  Future<void> getData() async {
    try {
      await youtubeApiController.fetchPlaylist(playlistId: id!);
      await youtubeApiController.fetchVideosFromPlaylist(playlistId: id!);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return InternetChecker(
      child: Scaffold(
        appBar: kIsWeb
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
              ),
        body: FutureBuilder(
          future: fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error loading data."));
            }
            var playlist = youtubeApiController.playlists[id];
            if (playlist == null) {
              return const Center(child: Text("Playlist not found."));
            }

            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            margin: const EdgeInsets.only(
                                top: 18.0, bottom: 18.0, left: 18.0),
                            decoration: BoxDecoration(
                                color: cardBackgroundColor,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      playlist.thumbnailUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, object, stackTrace) {
                                        return const Center(
                                          child: Icon(Icons.error),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  playlist.title,
                                  style: const TextStyle(fontSize: 22),
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      playlist.channelTitle,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Videos: ${playlist.videoCount}",
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  playlist.description,
                                  softWrap: true,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration:
                                const BoxDecoration(color: backgroundColor),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  const HeaderWidget(),
                                  const SizedBox(height: 18),
                                  Obx(
                                    () {
                                      if (youtubeApiController
                                          .playlistVideos.isEmpty) {
                                        return const Center(
                                          child: Text("No videos available."),
                                        );
                                      }

                                      return GridView.builder(
                                        itemCount: youtubeApiController
                                            .playlistVideos.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          mainAxisExtent: 380,
                                        ),
                                        itemBuilder: (context, index) =>
                                            Material(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: cardBackgroundColor,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            onTap: () {},
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0)),
                                                  child: AspectRatio(
                                                    aspectRatio: 16 / 9,
                                                    child: Image.network(
                                                      youtubeApiController
                                                          .playlistVideos[index]
                                                          .thumbnailUrl,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          object, stackTrace) {
                                                        return const Center(
                                                          child:
                                                              Icon(Icons.error),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 6.0),
                                                  child: Text(
                                                    youtubeApiController
                                                        .playlistVideos[index]
                                                        .title,
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                    maxLines: 3,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 6.0,
                                                            right: 8.0,
                                                            left: 8.0),
                                                    child: Text(
                                                      youtubeApiController
                                                          .playlistVideos[index]
                                                          .channelTitle,
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
