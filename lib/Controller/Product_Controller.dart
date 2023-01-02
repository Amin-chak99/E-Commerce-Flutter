import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../Model/Product_Model.dart';
import '../screen/CustomFullScreenDialog.dart';
import '../screen/CustomSnackBar.dart';

class ProductController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, addressController;

  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<ProductModel> employees = RxList<ProductModel>([]);

  @override
  void onInit() {
    super.onInit();

    collectionReference = firebaseFirestore.collection("users");
    employees.bindStream(getAllEmployees());
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
  }

  void clearEditingControllers() {
    nameController.clear();
    addressController.clear();
  }

  Stream<List<ProductModel>> getAllEmployees() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => ProductModel.fromMap(item)).toList());


}