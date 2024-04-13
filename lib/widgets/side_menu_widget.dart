import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tutorials_world/consts/constant.dart';
import 'package:tutorials_world/controllers/home_screen_controller.dart';
import 'package:tutorials_world/data/side_menu_data.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      color: const Color(0xFF171821),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    return Obx(() {
      var controller = Get.find<HomeScreenController>();
      var selectedScreen = controller.screen.value;
      final isSelected = selectedScreen == data.menu[index].screenDeterminer;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          color: isSelected ? selectionColor : Colors.transparent,
        ),
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          color: isSelected ? selectionColor : Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            onTap: () => controller.listTileSelected(
                screenTile: data.menu[index].screenDeterminer),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                  child: Icon(
                    isSelected
                        ? data.selectedMenu[index].icon
                        : data.menu[index].icon,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
                Expanded(
                  child: Text(
                    data.menu[index].title,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
