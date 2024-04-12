import 'package:flutter/material.dart';
import 'package:tutorials_world/controllers/home_screen_controller.dart';

class MenuModel {
  final IconData icon;
  final String title;
  final ScreenDeterminer screenDeterminer;

  const MenuModel(
      {required this.icon,
      required this.title,
      required this.screenDeterminer});
}
