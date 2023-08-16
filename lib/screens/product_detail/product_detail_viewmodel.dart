import 'package:flutter/material.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/menu/product_model.dart';
import 'package:get/get.dart';
class ProductDetailViewModel extends GetxController {

  late final Product obj;

  RxInt quantityCount = 1.obs;
  RxInt price = 0.obs;

  final List<Map<String,dynamic>> addOns =[
    {
      "name":"cheese",
      "image":"asset/images/download-removebg-preview.png"
    },
    {
      "name":"ketchup",
      "image":"asset/images/ketchup-bottle-clipart-2019-33-removebg-preview.png"
    },
    {
      "name":"mustard",
      "image":"asset/images/1594024128977_2366x2366-removebg-preview.png"
    },
  ];

  addCounter(){
    quantityCount.value +=1;
    price.value =quantityCount.value * obj.price;
  }
  subtractCounter(){
    if(quantityCount.value == 1){
      return;
    }
    quantityCount.value -=1;
    price.value =quantityCount.value * obj.price;




  }

  @override
  void onInit() {
    super.onInit();
    obj = Get.arguments;
    price.value = obj.price;
  }

  @override
  void dispose() {

    super.dispose();
  }

}