

import 'package:flutter/material.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/menu/product_model.dart';
import 'package:get/get.dart';

class SearchFoodViewModel extends GetxController{

  double filterRating = 0.0;


  RxList<Product> products = <Product>[].obs; // Specify the data type

  RxInt selectedTab = 0.obs;

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
      'name':"Steak",
      "img":"asset/images/steak.png",
    },
    {
      'name':"Snacks",
      "img":"asset/images/fries.png",
    },
    {
      'name':"Dessert",
      "img":"asset/images/cake-removebg-preview.png",
    },

  ];

  var priceRange = const RangeValues(0, 100).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    products.value=GlobalVars.products;

  }

  void updatePriceRange(RangeValues values) {
    priceRange.value = values;
  }

  updateFilterRating(double val){
    filterRating = val;
  }


  updateSelectTab(newValue){
    selectedTab.value=newValue;
  }

   applyFilters() {
    List<Product> filteredProducts = [...GlobalVars.products];

    // Apply price range filter
    filteredProducts = filteredProducts
        .where((product) =>
    product.price >= priceRange.value.start &&
        product.price <= priceRange.value.end)
        .toList();

    // Apply category filter if not 'ALL'
    if (selectedTab != 0) {
      filteredProducts = filteredProducts
          .where((product) => product.name.contains(tabViewItems[selectedTab.value]['name'].toString()))
          .toList();
    }

    // Apply rating filter
    if (filterRating > -1) {
      filteredProducts = filteredProducts
          .where((product) => product.rating >=filterRating)
          .toList();
    }

    products.value = filteredProducts;
  }


}