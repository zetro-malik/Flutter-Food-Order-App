

import 'package:flutter/material.dart';
import 'package:food_order_ui/screens/menu/product_model.dart';
import 'package:get/get.dart';

class MenuModel extends GetxController with SingleGetTickerProviderMixin {

  RxInt selectedTab = 0.obs;

  List<Product> products = [
     Product('asset/images/burger-removebg-preview.png', 'Beef Burger', 20, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
     Product('asset/images/pizza.png', 'Chesese Pizza', 32, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
     Product('asset/images/steak-removebg-preview.png', 'Beef Steak', 48, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
     Product('asset/images/cake-removebg-preview.png', 'Chocolate Cake', 12, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),
     Product('asset/images/fries.png', 'French Fries', 4, 'Big juicy beef burger with cheese, lettuce, tomator, onions, and special saucer!',4.8),

  ];

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
