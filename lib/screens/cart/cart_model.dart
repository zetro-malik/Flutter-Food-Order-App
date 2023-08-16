import 'package:food_order_ui/screens/menu/product_model.dart';

class CartItem{
  final Product product;
   int price;
   int quantity;

  CartItem(this.product, this.price ,this.quantity);
}