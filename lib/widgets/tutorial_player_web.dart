import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TutorialPlayer extends StatefulWidget {
  final String id;
  final bool isList;
  const TutorialPlayer({super.key, required this.id, required this.isList});

  @override
  State<TutorialPlayer> createState() => _TutorialPlayerState();
}

class _TutorialPlayerState extends State<TutorialPlayer> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    // if (kIsWeb) {

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.id,
      params: const YoutubePlayerParams(
        color: 'white',
        strictRelatedVideos: true,
        enableCaption: false,
        showControls: true,
        mute: false,
        showFullscreenButton: true,
      ),
    );
    // }
    super.initState();
  }

  Widget buildTutorialPlayer() {
    // final String titleLarge = _controller!.metadata.title;
    // final String creator = _controller.metadata.author;
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) => Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: player,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 16.0,
                        right: 16.0,
                        left: 16.0,
                      ),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: cardBackgroundColor),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Introduction to JavaScript + Setup | JavaScript Tutorial in Hindi #1',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            widget.isList
                ? Expanded(
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
                        itemCount: 5,
                        itemBuilder: (context, index) => Material(
                          borderRadius: BorderRadius.circular(12.0),
                          color: cardBackgroundColor,
                          child: InkWell(
                            onTap: () => print('Tutorial tapped'),
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
                                        YoutubePlayerController.getThumbnail(
                                      videoId: widget.id,
                                      webp: true,
                                    )),
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
                              selected: (index + 1) == 1 ? true : false,
                              selectedTileColor: selectionColor,
                              selectedColor: Colors.black,
                              title: Text(
                                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: (index + 1) == 1
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              trailing: (index + 1) == 1
                                  ? const Icon(CupertinoIcons.play_arrow_solid)
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTutorialPlayer();
  }
}
