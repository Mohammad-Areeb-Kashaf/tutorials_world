import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

enum NetworkStatus { online, offline }

class NetworkController extends GetxController {
  var connectionStatus = NetworkStatus.online.obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.last == ConnectivityResult.none) {
      connectionStatus(NetworkStatus.offline);
    } else {
      var isConnected = await InternetConnectionChecker().hasConnection;
      connectionStatus(
          isConnected ? NetworkStatus.online : NetworkStatus.offline);
    }
  }
}
