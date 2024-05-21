import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_world/controllers/home_screen_controller.dart';
import 'package:tutorials_world/models/menu_model.dart';

class SideMenuData {
  final selectedMenu = const <MenuModel>[
    MenuModel(
        icon: CupertinoIcons.play_arrow_solid,
        title: "Videos",
        screenDeterminer: ScreenDeterminer.videos),
    MenuModel(
        icon: CupertinoIcons.square_list_fill,
        title: "Playlists",
        screenDeterminer: ScreenDeterminer.playlists),
    MenuModel(
        icon: Icons.menu_rounded,
        title: "Request A Tutorial",
        screenDeterminer: ScreenDeterminer.requestTutorial),
  ];

  final menu = const <MenuModel>[
    MenuModel(
        icon: CupertinoIcons.play_arrow,
        title: "Videos",
        screenDeterminer: ScreenDeterminer.videos),
    MenuModel(
        icon: CupertinoIcons.square_list,
        title: "Playlists",
        screenDeterminer: ScreenDeterminer.playlists),
    MenuModel(
        icon: Icons.menu_outlined,
        title: "Request A Tutorial",
        screenDeterminer: ScreenDeterminer.requestTutorial),
  ];
}
