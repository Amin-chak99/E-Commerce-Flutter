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
      body:   Obx(
        () => ListView.builder(
        itemCount: controller.data.length,
        itemBuilder:(BuildContext context ,int index) {
          return CardProductCard(
            controller: controller,
            product: controller.data.keys.toList()[index],
            qte: controller.data.values.toList()[index],
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
      margin: EdgeInsets.symmetric (vertical: 10,horizontal: 15),
      padding: EdgeInsets.symmetric ( vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color:  Colors.white,
        border: Border.all(
            width: 0.2,
            color: Colors.grey
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1.2,
            blurRadius: 2,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network(product.imagename.toString()),),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.categories.toString() , style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18
                  ),),
                  IconButton(onPressed: (){
                    controller.removeAllProduct(product);

                  }, icon: Icon(Icons.delete , color: Colors.red,))

                ],
              ),
            SizedBox(height: 5,),
            Text(product.marque.toString().toUpperCase() , style: TextStyle(
              color: Colors.orange,
              fontSize: 20
            ),),
              SizedBox(height: 5,),
              Row(

                children: [
                  Text(product.prix.toString() , style: TextStyle(
                      color: Colors.black ,
                      fontSize: 18
                  ),),

                    IconButton(
                    onPressed: () {
                      controller.removeProduct(product);

                    },
                    icon: Icon (Icons.remove_circle),
                    ),
                    Text('${qte}'),
                    IconButton(
                    onPressed: () {
                      controller.AddProducts(product);

                    },
                    icon: Icon (Icons.add_circle),
                    ),

                ],
              ),


          ],)
        ],
      ),
    );
  }
}
