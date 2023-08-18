import 'package:food_order_ui/screens/cart/cart_model.dart';
import 'package:food_order_ui/screens/menu/product_model.dart';
import 'package:get/get.dart';

class GlobalVars{
  static RxInt  cartItemCount = 5.obs;
  static RxList<CartItem> cartList = <CartItem>[].obs;



  static List<Product> products = [
    Product('asset/images/burger-removebg-preview.png', 'Beef Burger', 20, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
    Product('asset/images/pizza.png', 'Chesese Pizza', 32, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',2.8),
    Product('asset/images/steak-removebg-preview.png', 'Beef Steak', 48, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',3.2),
    Product('asset/images/cake-removebg-preview.png', 'Chocolate Cake', 12, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
    Product('asset/images/fries.png', 'French Fries', 4, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
  ];

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