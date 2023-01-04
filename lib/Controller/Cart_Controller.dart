 import 'package:get/get.dart';

import '../Model/Product_Model.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();

  String x = "0";
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

  void removeProduct(ProductModel product) {
    if (listproduct.containsKey(product) &&listproduct [product] == 1) {
      listproduct.removeWhere((key, value) => key == product);
    } else {
      listproduct [product] -= 1;
    }
  }
  void removeAllProduct(ProductModel product) {
    listproduct.removeWhere((key, value) => key == product);

  }
  void lengthData(){
    x = data.length.toString();
    print("print:$x");
    update();

  }
  get productSubtotal => listproduct.entries
      .map((product) => product.key.prix * product.value)
      .toList();
  get total => listproduct.entries
      .map((product) => product.key.prix * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString();

}