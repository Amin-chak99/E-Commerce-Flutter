import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

            Container(
              padding: const EdgeInsets.only(right: 15),
              child:  Badge(
                toAnimate: true,
                position: BadgePosition.topEnd(top: 0),
                animationType: BadgeAnimationType.slide ,
                animationDuration:  Duration(milliseconds: 300),
                badgeContent: Text(""),
                child: IconButton(onPressed: () {

                }, icon: Icon(Icons.shopping_cart_checkout , color: Color.fromRGBO(255, 122, 51, 10),),),
              ),
            ),
          ],
        ),
      body: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey.shade300,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
