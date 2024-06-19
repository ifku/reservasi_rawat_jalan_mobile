import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No internet connection');
      } else {
        print('Internet connection available');
      }
    });
  }
}
