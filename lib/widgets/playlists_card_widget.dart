import 'package:flutter/material.dart';
import 'package:tutorials_world/data/playlist_details.dart';
import 'package:tutorials_world/widgets/playlist_card.dart';

class PlaylistsCardWidget extends StatelessWidget {
  const PlaylistsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistDetails = PlaylistDetails();

    return GridView.builder(
      itemCount: playlistDetails.playlistData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 344,
      ),
      itemBuilder: (context, index) => PlaylistCard(
        playlistDetails: playlistDetails.playlistData[index],
      ),
    );
  }
}
