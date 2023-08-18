

import 'package:flutter/material.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/menu/product_model.dart';
import 'package:get/get.dart';

class MenuModel extends GetxController with SingleGetTickerProviderMixin {

  RxInt selectedTab = 0.obs;

  List<Product> products = GlobalVars.products;

  List<Map<String, String>> tabViewItems = [
    {
      'name':"All",
      "img":"asset/images/steak-removebg-preview.png",
    },
    {
      'name':"Burger",
      "img":"asset/images/burger-removebg-preview.png",
    },
    {
      'name':"Pizza",
      "img":"asset/images/pizza.png",
    },
    {
      'name':"Dessert",
      "img":"asset/images/cake-removebg-preview.png",
    }
  ];
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    animation = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  updateSelectTab(newValue){
    selectedTab.value=newValue;
  }

}
