import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlistDetails;
  const PlaylistCard({super.key, required this.playlistDetails});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      color: cardBackgroundColor,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        onTap: () => print('Tutorial Tapped'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  imageUrl: playlistDetails.thumbnailUrl,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Text(
                  playlistDetails.title,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 6.0, right: 8.0, left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        playlistDetails.channelTitle,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Videos:- ${playlistDetails.videoCount}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
