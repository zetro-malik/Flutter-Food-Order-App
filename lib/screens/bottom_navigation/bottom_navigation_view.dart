import 'package:flutter/material.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'package:food_order_ui/widgets/scrollable_column.dart';

import 'package:get/get.dart';


class BottomNavigationView extends StatelessWidget {

  final BottomNavigationModel viewModel = Get.put(BottomNavigationModel());

   BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => viewModel.pages[viewModel.currentIndex.value]),
      bottomNavigationBar: Obx(() =>  BottomNavigationBar(
          backgroundColor: Colors.transparent,
          iconSize: 26,
          elevation: 0,
          currentIndex: viewModel.currentIndex.value,
          onTap: (index) {
              viewModel.currentIndex.value = index;
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: viewModel.getIconColor(0)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color: viewModel.getIconColor(1)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Obx(() =>  Badge( // Use Badge widget to add a badge to the cart icon
                  label: Text(
                    GlobalVars.cartList.value.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor:viewModel.getIconColor(2),
                  child: Icon(Icons.shopping_cart,color: viewModel.getIconColor(2)),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: viewModel.getIconColor(3)),
              label: '',
            ),
          ],
        ),
      ),
    );
  }



}
