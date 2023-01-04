import 'package:eshop/View/Cart_Total.dart';
import 'package:eshop/screen/cartPage.dart';
import 'package:eshop/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.sort , color: Color.fromRGBO(255, 122, 51, 10),),
          title: const Text('AC Market',style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(255, 122, 51, 10),
          ),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back ,color: Color.fromRGBO(255, 122, 51, 10),),
              onPressed: () {
                Get.to(()=> HomePage());
              },
            ),

          ],
        ),
        body: Container(
            child: Column(
              children: [
                Flexible(child: CartPage(),),
                Flexible(child: CartTotal(),),


              ],


            )
        )
    );
  }
}
