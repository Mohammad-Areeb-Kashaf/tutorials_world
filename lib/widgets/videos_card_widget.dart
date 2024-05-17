import 'package:flutter/material.dart';
import 'package:tutorials_world/data/video_details.dart';
import 'package:tutorials_world/widgets/video_card.dart';

class VideosCardWidget extends StatelessWidget {
  const VideosCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDetails = VideoDetails();

    return GridView.builder(
      itemCount: videoDetails.videoData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 344,
      ),
      itemBuilder: (context, index) => VideoCard(
        videoDetails: videoDetails.videoData[index],
      ),
    );
  }
}
