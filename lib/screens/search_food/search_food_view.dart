import 'package:flutter/material.dart';
import 'package:food_order_ui/screens/search_food/search_food_viewmodel.dart';
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
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
             const Text(
                'Filter Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Price Range'),
              RangeSlider(
                values: RangeValues(0, 100),
                min: 0,
                max: 100,
                onChanged: (RangeValues values) {
                  // Handle price range changes
                },
              ),
              tabView(),
              const SizedBox(height: 16),
              const Text('Rating'),
              RatingSelector(
                onChanged: (double rating) {
                  // Handle rating changes
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Apply filters and update product list
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget tabView(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      width: double.infinity,
      height: 170,
      child: ListView.builder(
        itemCount: viewModel.tabViewItems.length,
        scrollDirection:Axis.horizontal,
        itemBuilder: (context, index) {

          return TabBarCard(index: index, viewModel: viewModel);

        },),
    );
  }
}





class RatingSelector extends StatefulWidget {
  final ValueChanged<double> onChanged;

  RatingSelector({required this.onChanged});

  @override
  _RatingSelectorState createState() => _RatingSelectorState();
}

class _RatingSelectorState extends State<RatingSelector> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Select Rating: '),
        const SizedBox(width: 8),
        Slider(
          value: _rating,
          onChanged: (value) {
            setState(() {
              _rating = value;
              widget.onChanged(_rating);
            });
          },
          min: 0,
          max: 5,
          divisions: 5,
          label: _rating.toString(),
        ),
      ],
    );
  }
}