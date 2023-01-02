import 'package:get/get.dart';

import '../Controller/Product_Controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ProductController>(ProductController());
  }

}