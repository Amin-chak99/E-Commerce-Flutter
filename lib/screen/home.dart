import 'package:badges/badges.dart';
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

  _buildAddEditEmployeeView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Color(0xff1E2746),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${text} Employee',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.nameController,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.addressController,
                    validator: (value) {
                      return controller.validateAddress(value!);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.context!.width, height: 45),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        controller.saveUpdateEmployee(
                            controller.nameController.text,
                            controller.addressController.text,
                            docId!,
                            addEditFlag!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Employee",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete employee ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        controller.deleteData(docId);
      },
    );
  }
}