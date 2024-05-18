import 'package:flutter/material.dart';
import 'package:tutorials_world/widgets/header_widget.dart';
import 'package:tutorials_world/widgets/playlists_card_widget.dart';

class PlaylistsHomeWidget extends StatelessWidget {
  const PlaylistsHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              HeaderWidget(),
              SizedBox(height: 18),
              PlaylistsCardWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
