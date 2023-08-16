import 'package:food_order_ui/screens/cart/cart_model.dart';
import 'package:get/get.dart';

class GlobalVars{
  static RxInt  cartItemCount = 5.obs;
  static RxList<CartItem> cartList = <CartItem>[].obs;


  static addCounter(index){
   cartList.value[index].quantity +=1;
   cartList.value[index].price =cartList.value[index].quantity * cartList.value[index].product.price;
   cartList.refresh();
  }
  static subtractCounter(index){
    if(cartList.value[index].quantity ==1){
      return;
    }
    cartList.value[index].quantity -=1;
    cartList.value[index].price =cartList.value[index].quantity * cartList.value[index].product.price;
    cartList.refresh();
  }

 static removeItem(index){
    cartList.value.removeAt(index);
    cartList.refresh();
  }

}