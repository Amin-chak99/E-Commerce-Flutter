import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Cart_Controller.dart';
class CartTotal extends StatelessWidget {
  final CartController controller = Get.find() ;

   CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20 , right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total a Paye :' ,style: TextStyle(color: Colors.black,fontSize: 20),),
        Text(
          '${controller.total} DT TTC',style: TextStyle(color: Colors.black,fontSize: 20),),

      ],
    ),
    );
  }
}
