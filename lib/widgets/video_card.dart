import 'package:flutter/material.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/models/video_model.dart';
import 'package:get/get.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      color: cardBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () => Get.toNamed(
          "/tutorial?id=${video.id}&isList=${false}",
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(video.thumbnailUrl),
                  errorBuilder: (context, object, stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Text(
                  video.title,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 6.0, right: 8.0, left: 8.0),
                  child: Text(
                    video.channelTitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
