import 'package:badges/badges.dart';
import 'package:eshop/Controller/Categories_Controller.dart';
import 'package:eshop/screen/FournisseurPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Product_Controller.dart';
import 'cartPage.dart';



class HomePage extends GetView<ProductController> {





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
            icon: Icon(Icons.login_outlined ,color: Color.fromRGBO(255, 122, 51, 10),),
            onPressed: () {
              Get.to(()=> FournisseurPage());
            },
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
            child:  Badge(
              toAnimate: true,
              position: BadgePosition.topEnd(top: 0),
              animationType: BadgeAnimationType.slide ,
              animationDuration:  Duration(milliseconds: 300),
              badgeContent: Text(""),
              child: IconButton(onPressed: () {
                Get.to(()=> CartPage());
              }, icon: Icon(Icons.shopping_cart_checkout , color: Color.fromRGBO(255, 122, 51, 10),),),
            ),
          ),
        ],
      ),
      body: Container(
    child: LayoutBuilder(builder: (BuildContext ,BoxConstraints) {
    return SingleChildScrollView(

      child: Container(


          child: Column(children: [
            Container (
              margin: EdgeInsets.symmetric (horizontal: 15),
              padding: EdgeInsets.symmetric (horizontal: 15),
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
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
            GetBuilder<CategoriesController>(
                  init: CategoriesController(),
                  builder: (value){
                    return  SizedBox(
                      height: 70,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                        const VerticalDivider(
                          color: Colors.transparent,
                          width: 5,),
                        itemCount: value.images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              value.selectedMenuItem = index ;
                              value.categ() ;

                            } ,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(left: 7 ,right: 5),
                                    padding: const EdgeInsets.all(10),
                                    width: (value.descL[index].length*7)+100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color:  Colors.white,
                                      border: Border.all(
                                          width: 0.2,
                                          color: Colors.grey
                                      ),
                                      borderRadius: BorderRadius.circular(50),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset("assets/images/${value.images[index]}",width: 50,
                                            height: 50,),
                                        ),
                                        Container(padding: EdgeInsets.only(top: 5,left: 6),
                                          child: Text(value.descL[index],style: TextStyle(
                                              color: Colors.black
                                          ),),),],),),],),),)




                          ;},
                    )
                    );
                  }
              ),
           GetBuilder<CategoriesController>(
              init: CategoriesController(),
                   builder: (value){
                  return  Container(
                    margin: const EdgeInsets.symmetric (
                      vertical: 15,
                      horizontal: 10,), // Edge Insets.symmetric
                    child: Text(
                      value.desc,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 122, 51, 10),),
                    ),
                  );

                   }),


            Container(
              child :ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics() ,
                itemCount: controller.employees.length,
                itemBuilder: (context, index) => Card(

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
                              child: controller.employees[index].marque!.contains((controller.employees[index].marque!).toLowerCase())? Image.asset('assets/images/${(controller.employees[index].marque!).toLowerCase()}.png',):null,),
                            const SizedBox(height: 5.0,),
                            Text('${controller.employees[index].prix!} DT TTC',style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),),
                            const SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color:  Colors.grey.shade200,
                                    border: Border.all(
                                        width: 0,
                                        color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),),
                                  child: IconButton(onPressed: () async {

                                  }, icon: Icon(Icons.shopping_cart_outlined ),),),
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
                ),
              ),
            ),
          ],)
      ),

    );})
      )
    );
  }
}