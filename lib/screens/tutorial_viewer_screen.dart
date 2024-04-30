import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/widgets/internet_checker.dart';
// import 'package:tutorials_world/widgets/tutorial_player_mobile.dart';
import 'package:tutorials_world/widgets/tutorial_player_web.dart';

class TutorialViewerScreen extends StatefulWidget {
  const TutorialViewerScreen({
    super.key,
  });

  @override
  State<TutorialViewerScreen> createState() => _TutorialViewerScreenState();
}

class _TutorialViewerScreenState extends State<TutorialViewerScreen> {
  late final String? id;
  late bool isList = false;
  String title = '';
  String desc = '';
  String creator = '';

  @override
  void initState() {
    super.initState();
    id = Get.parameters['id'];
    isList = bool.parse(Get.parameters['isList'].toString());
  }

  @override
  Widget build(BuildContext context) {
    // if (kIsWeb) {
    // return TutorialPlayer(id: id.toString(), isList: isList);
    //} else {
    return InternetChecker(child: TutorialPlayer(id: id.toString(), isList: isList));
  }
}

  // @override
  // void deactivate() {
  //   super.deactivate();
  //   // if (!kIsWeb) {
  //   //   _controller!.pause();
  //   // }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // if (!kIsWeb) {
  //   //   _controller!.dispose();
  //   // }
  // }

