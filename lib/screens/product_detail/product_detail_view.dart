import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/cart/cart_model.dart';
import 'package:food_order_ui/screens/product_detail/product_detail_viewmodel.dart';
import 'package:food_order_ui/widgets/custom_button.dart';
import 'package:food_order_ui/widgets/product_cards.dart';
import 'package:food_order_ui/widgets/scrollable_column.dart';
import 'package:get/get.dart';
class ProductDetailView extends StatelessWidget {

  final ProductDetailViewModel viewModel = Get.put(ProductDetailViewModel());

   ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      extendBody: true,
      body: SafeArea(
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              backButton(),
             imageShowCase(),
             const SizedBox(height: 70),
             sideContainer(),

          ],
        ),
      ),
    );
  }



  Widget backButton(){
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 12),
      child: IconButton(onPressed: () => Get.back(),icon:Icon( Icons.arrow_back_ios,color: Colors.white,size: 28),),
    );
  }






  Widget sideContainer(){
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(70.0), // Border radius on top-left corner
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ratingAndPrice(),
                const SizedBox(height: 15),
                nameAndQuantity(),
                const SizedBox(height: 15),
                Text(viewModel.obj.description,style: const TextStyle(fontSize: 13,color: Colors.grey),),
                const SizedBox(height: 20),
                Text("Add Ons",style:  TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.w600),),
                addOnsList(),
                const SizedBox(height: 20),
                CustomButton( text: "Add to Cart", onPressed: ()  {
                  GlobalVars.cartList.add(CartItem(viewModel.obj, viewModel.price.value, viewModel.quantityCount.value));
                   HapticFeedback.lightImpact();
                   Get.back();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget addOnsList(){
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        itemCount: viewModel.addOns.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return AddOns(index: index, viewModel: viewModel);
      },),
    );
  }



  Widget nameAndQuantity(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(viewModel.obj.name,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
        quantitySelect()
      ],
    ) ;
  }

  Widget quantitySelect(){
    return Row(
      children: [
        IconButton(onPressed: () => viewModel.subtractCounter(), icon: Icon(Icons.remove_circle_outline,color: Colors.deepPurple,)),
        const SizedBox(width: 16),
        Obx(() => Text(viewModel.quantityCount.string,style: TextStyle(color: Colors.deepPurple,fontSize: 18),)),
        const SizedBox(width: 16),
        IconButton(onPressed: () => viewModel.addCounter(), icon: Icon(Icons.add_circle_outline,color: Colors.deepPurple,)),

      ],
    );
  }

  Widget ratingAndPrice(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            width: 90,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(25)
            ),
            child: Center(child: Text('⭐ ${viewModel.obj.rating.toString()}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),)),
          ),
        ),
        Obx(() => priceText(txt:  viewModel.price.value, fontSize: 22.0))
      ],
    );
  }



  Widget imageShowCase(){
    return
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: 200,
              height: 200,
              decoration:const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 70,
                    spreadRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              )),
          Hero(
            tag: viewModel.obj.image,
            child: Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: 0.1, // Rotation angle in radians
                child: Image.asset(viewModel.obj.image,height: 250,),
              ),
            ),
          ),
        ],
      );
  }


}
