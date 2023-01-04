import 'package:badges/badges.dart';
import 'package:eshop/Controller/Categories_Controller.dart';
import 'package:eshop/screen/FournisseurPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/Cart_Controller.dart';
import '../Controller/Product_Controller.dart';
import '../Model/Product_Model.dart';
import '../View/Card_View.dart';
import 'cartPage.dart';
class HomePage extends GetView<ProductController> {
  final cartController = Get.put(CartController());
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


            GetBuilder<ProductController>(
                init: ProductController(),
                builder: (value){
                  return  StreamBuilder<List<ProductModel>>(
                    stream: value.getAllEmployees(),
                    builder: (context,snapshot){
                      if(snapshot.hasError){

                        return Text('error');}
                      else if (snapshot.hasData){
                        print(' data exist');
                        return Container(
                          child :ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics() ,
                              itemCount: controller.employees.length,
                              itemBuilder: (context ,index) =>

                                  CardView(context ,index , controller , cartController)
                          ),
                        );
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },);
                }),
          ],)
      ),
    );})
      )
    );
  }

}