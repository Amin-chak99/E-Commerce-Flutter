import 'package:eshop/Controller/Cart_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../Controller/Controller.dart';
import '../Controller/Product_Controller.dart';

Widget CardView(BuildContext context, int index , ProductController controller, CartController cartController, categoriesController)=>
    Container(
        child: Container(
          margin: EdgeInsets.only(top: 10,left: 10,right: 10 ,bottom: 10),
          padding: EdgeInsets.all(20),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(controller.employees[index].imagename!,width: 140, height: 140,),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width: 140,
                    height: 50,
                    child: categoriesController.marq.contains((productController.employees[index].marque!).toLowerCase())? Image.asset('assets/images/${(productController.employees[index].marque!).toLowerCase()}.png',):null,),                  const SizedBox(height: 5.0,),
                  Text('${controller.employees[index].prix!} DT TTC',style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),),
                  const SizedBox(height: 5.0,),
                  Row(
                    children: [
                      GetBuilder<CartController>(
                          init: CartController(),
                          builder: (value){
                            return    Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color:  Colors.grey.shade200,
                                border: Border.all(
                                    width: 0,
                                    color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),),
                              child: IconButton(onPressed: () async {
                                cartController.AddProducts(productController.employees[index]);
                                value.lengthData();

                              }, icon: Icon(Icons.shopping_cart_outlined ),),);
                          }),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color:  Colors.grey.shade200,
                          border: Border.all(
                              width: 0,
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),
                        child: IconButton(onPressed: () {  }, icon: Icon(Icons.remove_red_eye_outlined ),),),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color:  Colors.grey.shade200,
                          border: Border.all(
                              width: 0,
                              color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),),
                        child: IconButton(onPressed: () {  }, icon: Icon(Icons.favorite_border_rounded ),),),
                    ],),],),
              Container(
                padding: EdgeInsets.only(left: 5 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26,
                      child:  Text(controller.employees[index].marque!,style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(255, 122, 51, 10),
                          fontWeight: FontWeight.bold
                      ),),),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(controller.employees[index].categories!),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.36,
                        child: Text(
                          controller.employees[index].description!,style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,),),),),],),),],),)
    );