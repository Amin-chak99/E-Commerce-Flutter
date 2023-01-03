import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/Network_Controller.dart';

class CarouselLoading extends StatelessWidget {
  const CarouselLoading({Key? key}) : super(key: key);


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
            GetBuilder<NetworkController>(
                init: NetworkController(),
                builder: (value){
                  return IconButton(onPressed: ( ) {value.checkConnectitivy();}, icon: Icon(Icons.refresh_outlined , color: Colors.orange,));
                }),

            Container(
              padding: const EdgeInsets.only(right: 15),
              child:  Badge(
                toAnimate: true,
                position: BadgePosition.topEnd(top: 0),
                animationType: BadgeAnimationType.slide ,
                animationDuration:  Duration(milliseconds: 300),
                badgeContent: Text("?"),
                child: IconButton(onPressed: () {

                }, icon: Icon(Icons.shopping_cart_checkout , color: Color.fromRGBO(255, 122, 51, 10),),),
              ),
            ),


          ],
        ),
      body: Column(
        children: [
          Container (
            margin: EdgeInsets.symmetric (horizontal: 15),
            padding: EdgeInsets.symmetric (horizontal: 15),
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30)),),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 3),
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.69,
                  child :TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here...",
                    ),
                  ),
                ),
                IconButton(onPressed:() {}, icon: Icon(Icons.photo ,color: Color.fromRGBO(255, 122, 51, 10),  ))
              ],),),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric (
              vertical: 15,
              horizontal: 10,), // Edge Insets.symmetric
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 122, 51, 10),),), // Text
          ),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey.shade300,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: AspectRatio(
                      aspectRatio: 60/9,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Container(
                  margin: const EdgeInsets.only(left: 20 , right: 20 ,top: 10 ,bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: AspectRatio(
                      aspectRatio: 15/9,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20 , right: 20 ,top: 10 ,bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: AspectRatio(
                      aspectRatio: 15/9,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      )

    );
  }
}
