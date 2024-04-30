import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/controllers/network_controller.dart';

class NetworkAwareWidget extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;

  NetworkAwareWidget(
      {super.key, required this.onlineChild, required this.offlineChild});

  final networkController = Get.find<NetworkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        networkController.connectionStatus.value == NetworkStatus.online
            ? onlineChild
            : offlineChild);
  }
}
