import 'package:eshop/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/Cart_Controller.dart';
import '../Model/Product_Model.dart';
class CartPage extends StatelessWidget {
  final CartController controller = Get.find() ;

   CartPage({Key? key}) : super(key: key);

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
        child: ListView.builder(
          itemCount: controller.products.length,
            itemBuilder:(BuildContext context ,int index) {
            return CardProductCard(
              controller: controller,
              product: controller.products.key.toList()[index],
              qte: controller.products.value.toList()[index],
              index: index,);
            }
            ),
      ),
    );
  }
}

class CardProductCard extends StatelessWidget {
  final CartController controller ;
  final ProductModel product ;
  final int qte ;
  final int index ;

  const CardProductCard({Key? key,
    required this.controller,
    required this.product,
    required this.qte,
    required this.index,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(child: Image.network(product.imagename.toString()),)
        ],
      ),
    );
  }
}
