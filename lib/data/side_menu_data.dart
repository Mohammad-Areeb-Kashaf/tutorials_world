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
        icon: Icons.settings_rounded,
        title: "Settings",
        screenDeterminer: ScreenDeterminer.settings),
    MenuModel(
        icon: CupertinoIcons.person_fill,
        title: "Profile",
        screenDeterminer: ScreenDeterminer.profile)
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
        icon: Icons.settings_outlined,
        title: "Settings",
        screenDeterminer: ScreenDeterminer.settings),
    MenuModel(
        icon: CupertinoIcons.person,
        title: "Profile",
        screenDeterminer: ScreenDeterminer.profile)
  ];
}
