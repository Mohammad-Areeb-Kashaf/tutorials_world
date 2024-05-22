import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:tutorials_world/models/video_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorialDetails extends StatelessWidget {
  const TutorialDetails({super.key, required this.video});
  final Video? video;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          video!.title,
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 8),
        Linkify(
          text: video!.description,
          style: const TextStyle(fontSize: 16),
          softWrap: true,
          onOpen: (link) async {
            if (await canLaunchUrl(Uri.parse("${link.url.toString()}/"))) {
              await launchUrl(Uri.parse("${link.url.toString()}/"));
            } else {}
          },
        ),
      ],
    );
  }
}
