 import 'package:get/get.dart';

import '../Model/Product_Model.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();


  var listproduct= {}.obs ;

  void AddProducts(ProductModel product) {
    if (listproduct.containsKey(product)){
      listproduct[product] +=1 ;
    }else{
      listproduct[product] =1;
    }
    Get.snackbar("Produit Ajoutée", "vous avez ajoutez le produit de marque ${product.marque} au panier",
    snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2)
    );


  }
  RxMap get  data => listproduct ;

}