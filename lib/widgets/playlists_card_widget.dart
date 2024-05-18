import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/controllers/youtube_api_controller.dart';
import 'package:tutorials_world/widgets/playlist_card.dart';

class PlaylistsCardWidget extends StatelessWidget {
  const PlaylistsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final youtubeApiController = Get.find<YoutubeApiController>();

    return Obx(
      () => GridView.builder(
        itemCount: youtubeApiController.playlists.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 344,
        ),
        itemBuilder: (context, index) => PlaylistCard(
          playlist: youtubeApiController.playlists[index],
        ),
      ),
    );
  }
}
