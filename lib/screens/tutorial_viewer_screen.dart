import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/widgets/internet_checker.dart';
import 'package:tutorials_world/widgets/tutorial_player.dart';

class TutorialViewerScreen extends StatefulWidget {
  const TutorialViewerScreen({
    super.key,
  });

  @override
  State<TutorialViewerScreen> createState() => _TutorialViewerScreenState();
}

class _TutorialViewerScreenState extends State<TutorialViewerScreen> {
  late final String? id;
  late final String? playlistId;
  late bool isList = false;
  String title = '';
  String desc = '';
  String creator = '';

  @override
  void initState() {
    super.initState();
    id = Get.parameters['id'];
    playlistId = Get.parameters['playlistId'];
    isList = bool.parse(Get.parameters['isList'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return InternetChecker(
      child: Scaffold(
        appBar: kIsWeb
            ? null
            : AppBar(
                backgroundColor: Colors.transparent,
              ),
        body: TutorialPlayer(
          id: id.toString(),
          isList: isList,
          playlistId: playlistId,
        ),
      ),
    );
  }
}
