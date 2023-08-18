import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_order_ui/screens/menu/menu_viewmodel.dart';
import 'package:food_order_ui/screens/menu/product_model.dart';
import 'package:food_order_ui/screens/product_detail/product_detail_view.dart';
import 'package:food_order_ui/widgets/product_cards.dart';
import 'package:food_order_ui/widgets/scrollable_column.dart';
import 'package:get/get.dart';

class MenuView extends StatelessWidget {

  final MenuModel viewModel = Get.put(MenuModel());

   MenuView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            myAppBar(),
            const SizedBox(height: 10),
            searchTextForm(),
            tabView(),
            const SizedBox(height: 20),
            promotions(),
            const SizedBox(height: 20),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 22.0),
              child:  Text('Popular',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            ),
            gridView(context)

          ],
        )
      ),
    );
  }




  Widget gridView(context){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child:GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ? .9 : 2,
          ),
          itemCount: viewModel.products.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
                onTap: () {
                  Get.to(()=> ProductDetailView(),arguments: viewModel.products[index] );
                },
                child: GridCard(index: index, viewModel: viewModel));
          },
        )
    );
  }




  Widget myAppBar(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0,vertical: 14.0),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Menu", style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('asset/images/steak-removebg-preview.png'),
          )
        ],
      ),
    );
  }



  Widget searchTextForm(){
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 26.0),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30)
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


Widget promotions(){
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             const Text('Promotions',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              Container(
                width: double.infinity,
                height: 160,
                padding: EdgeInsets.all(16.0),
                decoration:   BoxDecoration(
                    color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('today\'s Offer',style: TextStyle(color: Colors.white),),
                    SizedBox(height: 8),
                    Text('Free box of Fries',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                    SizedBox(height: 8),
                    Text('on all orders above \$150',style: TextStyle(color: Colors.white)),
                  ],
                ),

              )
            ],
          )
        ),
        AnimatedBuilder(
          animation: viewModel.animationController,
          builder: (context, child) {
            return Positioned(
              top: viewModel.animation.value,
              right: -5,
              child: Image.asset('asset/images/fries.png', height: 150),
            );
          },
        ),

            ],
          );
}

}
