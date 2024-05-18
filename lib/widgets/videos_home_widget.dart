import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tutorials_world/widgets/header_widget.dart';
import 'package:tutorials_world/widgets/videos_card_widget.dart';

class VideosHomeWidget extends StatelessWidget {
  const VideosHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(height: 18),
              HeaderWidget(),
              SizedBox(height: 18),
              VideosCardWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
