import 'package:flutter/material.dart';
import 'package:tutorials_world/widgets/header_widget.dart';
import 'package:tutorials_world/widgets/playlists_card_widget.dart';

class PlaylistsHomeWidget extends StatelessWidget {
  const PlaylistsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          SizedBox(height: 18),
          HeaderWidget(),
          SizedBox(height: 18),
          Expanded(child: PlaylistsCardWidget()),
        ],
      ),
    );
  }
}
