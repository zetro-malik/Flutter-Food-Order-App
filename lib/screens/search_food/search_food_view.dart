import 'package:flutter/material.dart';
import 'package:food_order_ui/screens/search_food/search_food_viewmodel.dart';
import 'package:food_order_ui/widgets/custom_widgets.dart';
import 'package:food_order_ui/widgets/product_cards.dart';
import 'package:get/get.dart';

class SearchFoodView extends StatelessWidget {
   SearchFoodView({Key? key}) : super(key: key);

  final SearchFoodViewModel viewModel = Get.put(SearchFoodViewModel());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
        child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top:  50.0,right: 18 ),
            child: Row(
              children: [
                Expanded(child: searchTextForm()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.deepPurple,
                  ),

                  height: 50,
                  width: 50,

                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.filter_list, // where I want to add 3 horizontal line icon
                          color: Colors.white,
                        ), onPressed:() => _showFilterBottomSheet(context),
                      ),
                    ],


                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }


  Widget searchTextForm(){
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 26.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12)
        ),
        child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search,color: Colors.grey,)
          ),
        ),
      ),
    );
  }


  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const  Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16.0),
             child:  Text(
                'Filter Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
           ),
            const SizedBox(height: 16),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child:  Text('Price Range'),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Obx(() =>  Column(
                children: [
                  RangeSlider(
                      values: viewModel.priceRange.value,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      onChanged: (RangeValues values) {
                       viewModel.updatePriceRange(values);
                      },
                    ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("From :${viewModel.priceRange.value.start.toString()}",style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                        Text("To :${viewModel.priceRange.value.end.toString()}",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),),

                      ],
                    ),
                  ),
                ],
              ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child:  Text('Select Category'),
            ),
            tabView(),
            const SizedBox(height: 16),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child:  Text('Rating'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RatingSelector(
                onChanged: (double rating) {
                  viewModel.updateFilterRating(rating);
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filters and update product list
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Filters'),
                ),
              ),
            ),
            const SizedBox(height: 16),

          ],
        );
      },
    );
  }


  Widget tabView(){
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        itemCount: viewModel.tabViewItems.length,
        scrollDirection:Axis.horizontal,
        itemBuilder: (context, index) {
          return TabBarCard(index: index, viewModel: viewModel);
        },),
    );
  }
}




