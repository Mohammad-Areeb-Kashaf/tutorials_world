import 'package:get/get.dart';
import 'package:tutorials_world/widgets/playlists_home_widget.dart';
import 'package:tutorials_world/widgets/profile_home_widget.dart';
import 'package:tutorials_world/widgets/request_a_tutorial_home_widget.dart';
import 'package:tutorials_world/widgets/videos_home_widget.dart';

enum ScreenDeterminer { videos, playlists, requestATutorial, profile }

class HomeScreenController extends GetxController {
  var screen = ScreenDeterminer.videos.obs;

  screenDeterminer() {
    switch (screen.value) {
      case ScreenDeterminer.videos:
        return const VideosHomeWidget();
      case ScreenDeterminer.playlists:
        return const PlaylistsHomeWidget();
      case ScreenDeterminer.requestATutorial:
        return const RequestATutorialHomeWidget();
      case ScreenDeterminer.profile:
        return const ProfileHomeWidget();
      default:
        return const VideosHomeWidget();
    }
  }

  listTileSelected({required ScreenDeterminer screenTile}) {
    switch (screen.value) {
      case ScreenDeterminer.videos:
        screen.value = screenTile;
        break;
      case ScreenDeterminer.playlists:
        screen.value = screenTile;
        break;
      case ScreenDeterminer.requestATutorial:
        screen.value = screenTile;
        break;
      case ScreenDeterminer.profile:
        screen.value = screenTile;
        break;
      default:
        screen.value = ScreenDeterminer.videos;
        break;
    }
  }
}
