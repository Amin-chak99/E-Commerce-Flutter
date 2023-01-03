 import 'package:get/get.dart';

import '../Model/Product_Model.dart';

class CartController extends GetxController {

  var _product= {}.obs ;

  void AddProducts(ProductModel product) {
    if (_product.containsKey(product)){
      _product[product] +=1 ;
    }else{
      _product[product] =1;
    }
    Get.snackbar("Produit Ajoutée", "vous avez ajoutez le produit de marque ${product.marque} au panier",
    snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2)
    );

  }
  get products => _product ;

}