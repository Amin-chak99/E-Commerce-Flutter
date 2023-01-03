import 'package:get/get.dart';

class CategoriesController extends GetxController{
  final List<String> images=["all.png","pcb.jpg","pcp.jpg","tel.jpg","telv.jpg","vetf.jpg","veth.jpg","watch.jpg","accinfo.jpg"];
  final List<String> descL=["","Pc bureau","Pc portable","Telephone","Television","Vetement femme","Vetement homme", "Montre", "Accessoire informatique"];
  final List<String> marq=["asus","lenovo","samsung","lg","oppo","huawei","beko", "gree", "hp","tecno","adidas","chanel","apple","haier", "dell","beko","msi"];

  String desc="tout les produit";
  int selectedMenuItem = 0;
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
      case 8:desc="Accessoire informatique";break;}
    update();
  }

}