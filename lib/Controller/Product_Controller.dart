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

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Address can not be empty";
    }
    return null;
  }

  void saveUpdateEmployee(
      String marque, String imagename, String prix, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      collectionReference
          .add({'name': marque, 'address': imagename}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Employee Added",
            message: "Employee added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference
          .doc(prix)
          .update({'name': marque, 'address': imagename}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Employee Updated",
            message: "Employee updated successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
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

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Employee Deleted",
          message: "Employee deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }
}