

import 'package:flutter/material.dart';
import 'package:food_order_ui/screens/cart/cart_view.dart';
import 'package:food_order_ui/screens/menu/menu_view.dart';
import 'package:get/get.dart';

class BottomNavigationModel extends GetxController{
  RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    MenuView(),
    Text('search'),
    CartView(),
    Text('profile'),
  ];

  Color getIconColor(int index){
    if (currentIndex.value == index){
      return Colors.deepPurple;
    }
    return Colors.grey;
  }


}