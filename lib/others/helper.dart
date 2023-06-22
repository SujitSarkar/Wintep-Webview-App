import 'package:connectivity_plus/connectivity_plus.dart';

class Helper{

  Future<bool> checkConnectivity()async{
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      return Future.value(true);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return Future.value(true);
    }else{
      return Future.value(false);
    }
  }
}