import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Cart_Controller.dart';
class CartTotal extends StatelessWidget {
  final CartController controller = Get.find() ;
  String total = "0.000 DT TTC";

  Text totale(){
    try{
      return Text('${controller.total} DT TTC', style: TextStyle(fontSize: 16 ,color: Colors.red),);

    }catch (e){
      return Text(total ,style: TextStyle(fontSize: 16 ,color: Colors.red),);
    }
  }

   CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Colors.white,
        border: Border.all(
            width: 0.2,
            color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1.5,
            blurRadius: 3,
            offset: Offset(0, 5), ),],),
      margin: EdgeInsets.only(top: 15 ,left: 20 , right: 20),
     padding: EdgeInsets.all(5),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Total a Paye :' ,style: TextStyle(color: Colors.black,fontSize: 20),),
      GetBuilder<CartController>(
          init: CartController(),
          builder: (value){
            
            return  Obx(() => totale())
            ;
          }),

          ],
        ),
        OutlinedButton(
          child: Text("Commander",style: TextStyle(fontSize: 16),),
          style: OutlinedButton.styleFrom(
            primary: Colors.orange,
            side: BorderSide(
              color: Colors.orange,
            ),
          ),
          onPressed: () {
          },
        ),
      ],
    )
    );
  }
}
