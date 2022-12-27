import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/screen/addproduce.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'cartPage.dart';
class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
  String? image;String? prix;String? description;String? categories;String? marque;
  home({this.image, this.prix, this.description, this.categories,this.marque});
}
class _homeState extends State<home> {
  static List<home> Liste= [];
  var ls=[];

  final List<String> images=["all.png","pcb.jpg","pcp.jpg","tel.jpg","telv.jpg","vetf.jpg","veth.jpg","watch.jpg","accinfo.jpg"];
  final List<String> descL=["","Pc bureau","Pc portable","Telephone","Television","Vetement femme","Vetement homme", "Montre", "Accessoire informatique"];
  final List<String> marq=["asus","lenovo","samsung","lg","oppo","huawei","beko", "gree", "hp","tecno","adidas","chanel","apple","haier", "dell","beko","msi"];
  String desc="tout les produit";
  int selectedMenuItem = 0;
  int i=0;
  static bool etats=false;
  void categ(){
    switch(selectedMenuItem){
      case 0:desc="Tous les produits";break;
      case 1:desc="Pc bureau";break;
      case 2:desc="Pc portable";break;
      case 3:desc="Telephone";break;
      case 4:desc="Television";break;
      case 5:desc="Vetement femme";break;
      case 6:desc="Vetement homme";break;
      case 7:desc="Montre";break;
      case 8:desc="Accessoire informatique";break;}}
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
                Navigator.of(context).pop();
                Navigator.pushNamed(context,'/Fournisseur');
              },
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child:  Badge(
                toAnimate: true,
                position: BadgePosition.topEnd(top: 0),
                animationType: BadgeAnimationType.slide ,
                animationDuration:  Duration(milliseconds: 300),
                badgeContent: Text(Liste.length.toString()),
                child: IconButton(onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>cartPage(Liste)));
                }, icon: Icon(Icons.shopping_cart_checkout , color: Color.fromRGBO(255, 122, 51, 10),),),
              ),
            ),
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height ,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 10),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45) ,
                    topLeft: Radius.circular(45))
            ),
            child: Container(
              child: LayoutBuilder(builder: (BuildContext ,BoxConstraints) {
                return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: 70,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                              const VerticalDivider(
                                color: Colors.transparent,
                                width: 5,),
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    selectedMenuItem=index;
                                    categ();
                                    setState(() {});
                                  } ,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(left: 7 ,right: 5),
                                          padding: const EdgeInsets.all(10),
                                          width: (descL[index].length*7)+100,
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
                                                child: Image.asset("assets/images/${images[index]}",width: 50,
                                                  height: 50,),
                                              ),
                                              Container(padding: EdgeInsets.only(top: 5,left: 6),
                                                child: Text(descL[index],style: TextStyle(
                                                    color: Colors.black
                                                ),),),],),),],),),);},),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric (
                              vertical: 15,
                              horizontal: 10,), // Edge Insets.symmetric
                            child: Text(
                              desc,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 122, 51, 10),),
                            ),
                          ),
                          StreamBuilder<List<User>>(
                            stream: readUsers(),
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('error ${snapshot.error}');}
                              else if (snapshot.hasData){
                                print(' data exist');
                                final users = snapshot.data!;
                                return ListView(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics() ,
                                  children: users.map(buildUser).toList(),);
                              }else{
                                return Center(child: CircularProgressIndicator(),);
                              }},),],),));}),)));
  }
  Widget buildUser( User user) =>Container(
    child: Container(
      margin: EdgeInsets.only(top: 10,left: 20,right: 20 ,bottom: 10),
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
              Image.network(user.imgRef ,width: 140, height: 140,),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: 140,
                height: 50,
                child: marq.contains((user.nomProduit).toLowerCase())? Image.asset('assets/images/${(user.nomProduit).toLowerCase()}.png',):null,),
              const SizedBox(height: 5.0,),
              Text('${user.prix} DT TTC',style: const TextStyle(
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
                      setState(()  {


                        Liste.add(home(
                            prix: user.prix,
                            categories: user.categorie,
                            image: user.imgRef,
                            description: user.description,
                            marque: user.nomProduit));


                      });
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
                  child:  Text(user.nomProduit ,style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 122, 51, 10),
                      fontWeight: FontWeight.bold
                  ),),),
                const SizedBox(
                  height: 5.0,
                ),
                Text(user.categorie),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                    child: Text(
                      user.description,style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,),),),),],),),],),),);
  Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) => snapshot.docs.map((doc) =>User.fromJson(doc.data() )).toList());



}