import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/controllers/youtube_api_controller.dart';
import 'package:tutorials_world/models/video_model.dart';
import 'package:tutorials_world/widgets/tutorial_details.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TutorialPlayer extends StatefulWidget {
  final String id;
  final bool isList;
  const TutorialPlayer({super.key, required this.id, required this.isList});

  @override
  State<TutorialPlayer> createState() => _TutorialPlayerState();
}

class _TutorialPlayerState extends State<TutorialPlayer> {
  final youtubeApiController = Get.find<YoutubeApiController>();
  late final YoutubePlayerController _controller;
  late final Video? video;

  @override
  void initState() {
    if (widget.isList) {
      video = youtubeApiController.playlistVideos
          .firstWhereOrNull((videoItem) => videoItem.id == widget.id);
    } else {
      video = youtubeApiController.videos
          .firstWhereOrNull((videoItem) => videoItem.id == widget.id);
    }
    _controller = YoutubePlayerController.fromVideoId(
      autoPlay: true,
      videoId: widget.id,
      params: const YoutubePlayerParams(
        showVideoAnnotations: false,
        color: 'white',
        strictRelatedVideos: true,
        enableCaption: false,
        showControls: true,
        mute: false,
        showFullscreenButton: true,
      ),
    );
    super.initState();
  }

  Widget buildTutorialPlayer() {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: player,
                    ),
                  ),
                ),
                widget.isList
                    ? Container(
                        margin: const EdgeInsets.only(
                          bottom: 16.0,
                          right: 16.0,
                          left: 16.0,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: cardBackgroundColor),
                        child: video == null
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : TutorialDetails(video: video),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          widget.isList
              ? Obx(() {
                  return Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                        right: 16.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: cardBackgroundColor),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.isList
                            ? youtubeApiController.playlistVideos.length
                            : 0,
                        itemBuilder: (context, index) => Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: cardBackgroundColor,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              Get.toNamed(
                                  "/tutorial?id=${youtubeApiController.playlistVideos[index].id}&isList=${true}");
                            },
                            borderRadius: BorderRadius.circular(12.0),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16.0),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      widget.isList
                                          ? youtubeApiController
                                              .playlistVideos[index]
                                              .thumbnailUrl
                                          : "",
                                    ),
                                    errorBuilder:
                                        (context, object, stackTrace) {
                                      return const Center(
                                        child: Icon(Icons.error),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              selected: youtubeApiController
                                          .playlistVideos[index].id ==
                                      video!.id
                                  ? true
                                  : false,
                              selectedTileColor: selectionColor,
                              selectedColor: Colors.black,
                              title: Text(
                                widget.isList
                                    ? youtubeApiController
                                        .playlistVideos[index].title
                                    : "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: youtubeApiController
                                              .playlistVideos[index].id ==
                                          video!.id
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
              : Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      right: 16.0,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: cardBackgroundColor),
                    child: video == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : TutorialDetails(
                            video: video,
                          ),
                  ),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTutorialPlayer();
  }
}
