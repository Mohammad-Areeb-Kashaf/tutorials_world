import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/controllers/youtube_api_controller.dart';
import 'package:tutorials_world/widgets/header_widget.dart';
import 'package:tutorials_world/widgets/playlists_card_widget.dart';

class PlaylistsHomeWidget extends StatelessWidget {
  const PlaylistsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final youtubeApiController = Get.find<YoutubeApiController>();
    return Obx(
      () => youtubeApiController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      HeaderWidget(),
                      SizedBox(height: 18),
                      PlaylistsCardWidget(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
