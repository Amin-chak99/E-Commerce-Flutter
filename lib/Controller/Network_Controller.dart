import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {


  String Conctivite = 'none' ;
  void checkConnectitivy() async {
    var result = await Connectivity().checkConnectivity();

    Conctivite = result.name ;
    update();


    print(result.name);
  }
}