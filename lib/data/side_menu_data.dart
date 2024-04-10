import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorials_world/models/menu_model.dart';

class SideMenuData {
  final selectedMenu = const <MenuModel>[
    MenuModel(icon: CupertinoIcons.play_arrow_solid, title: "Videos"),
    MenuModel(icon: CupertinoIcons.square_list_fill, title: "Playlists"),
    MenuModel(icon: Icons.settings_rounded, title: "Settings"),
    MenuModel(icon: CupertinoIcons.person_fill, title: "Profile")
  ];

  final menu = const <MenuModel>[
    MenuModel(icon: CupertinoIcons.play_arrow, title: "Videos"),
    MenuModel(icon: CupertinoIcons.square_list, title: "Playlists"),
    MenuModel(icon: Icons.settings_outlined, title: "Settings"),
    MenuModel(icon: CupertinoIcons.person, title: "Profile")
  ];
}
