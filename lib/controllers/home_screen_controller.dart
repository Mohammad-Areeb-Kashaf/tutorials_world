import 'package:get/get.dart';
import 'package:tutorials_world/widgets/no_internet_home_widget.dart';
import 'package:tutorials_world/widgets/playlists_home_widget.dart';
import 'package:tutorials_world/widgets/profile_home_widget.dart';
import 'package:tutorials_world/widgets/request_tutorial_home_widget.dart';
import 'package:tutorials_world/widgets/videos_home_widget.dart';

enum ScreenDeterminer {
  videos,
  playlists,
  requestTutorial,
  profile,
  noInternet
}

class HomeScreenController extends GetxController {
  var screen = ScreenDeterminer.videos.obs;

  screenDeterminer() {
    switch (screen.value) {
      case ScreenDeterminer.videos:
        return const VideosHomeWidget();
      case ScreenDeterminer.playlists:
        return const PlaylistsHomeWidget();
      case ScreenDeterminer.requestTutorial:
        return const RequestTutorialHomeWidget();
      case ScreenDeterminer.profile:
        return const ProfileHomeWidget();
      case ScreenDeterminer.noInternet:
        return const NoInternetHomeWidget();
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
      case ScreenDeterminer.requestTutorial:
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
