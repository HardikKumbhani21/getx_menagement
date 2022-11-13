import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetCheckController extends GetxController {
  late bool internet;
  bool internetCheckLoder = false;

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    checkInternetStatus().then((value) {
      internet = value;
      internetCheckLoder = true;
      internetStatusCheck();
      update();
    });
    super.onInit();
  }

  Future<bool> checkInternetStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
      // I am connected to a mobile network.
    } else {
      // I am not connected network.
      return false;
    }
  }

  void internetStatusCheck() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        internet = true;
        update();

        // I am connected to a mobile network.
      } else {
        // I am not connected network.
        internet = false;
        update();
        print("Change: $internet");
      }
    });
  }
}
