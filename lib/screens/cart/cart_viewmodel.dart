

import 'package:food_order_ui/helper/global_vars.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{


  getTotalText(){
    int total = 0;
    for (var item in GlobalVars.cartList.value) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

}