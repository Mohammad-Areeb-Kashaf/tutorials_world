import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/models/video_model.dart';

class VideoCard extends StatelessWidget {
  final Video videoDetails;
  const VideoCard({
    super.key,
    required this.videoDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      color: cardBackgroundColor,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        onTap: () => print('Tutorial Tapped'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(12.0)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: videoDetails.thumbnailUrl,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Text(
                videoDetails.title,
                softWrap: true,
                style: const TextStyle(fontSize: 20),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 6.0, right: 8.0, left: 8.0),
                  child: Text(
                    videoDetails.channelTitle,
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
