import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  String? imagename;
  String? prix;
  String? description;
  String? categories;
  String? marque;
  ProductModel(
      {required this.imagename, required this.prix, required this.description, required this.categories, required this.marque});

  ProductModel.fromMap(DocumentSnapshot data) {
      marque= data['nom_Produit'];
      categories=data['categorie'];
      description= data['description'];
      prix= data['prix'];
      imagename= data['imagename'];


} }