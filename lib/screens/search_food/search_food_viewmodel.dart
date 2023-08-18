

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFoodViewModel extends GetxController{

  RxInt selectedTab = 0.obs;
  double filterRating = 0;
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
    },

  ];

  var priceRange = const RangeValues(0, 100).obs;

  void updatePriceRange(RangeValues values) {
    priceRange.value = values;
  }

  updateFilterRating(double val){
    filterRating = val;
  }


  updateSelectTab(newValue){
    selectedTab.value=newValue;
  }


}