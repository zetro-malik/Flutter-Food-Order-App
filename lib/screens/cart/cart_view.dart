import 'package:flutter/material.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/cart/cart_viewmodel.dart';
import 'package:food_order_ui/screens/get_started/get_started_view.dart';
import 'package:food_order_ui/widgets/custom_button.dart';
import 'package:food_order_ui/widgets/product_cards.dart';
import 'package:food_order_ui/widgets/scrollable_column.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {

  final CartViewModel viewModel = Get.put(CartViewModel());

   CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cartCountTxt(),
              Obx(() => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItemCard(index: index);
                  },
                  itemCount: GlobalVars.cartList.value.length,
                ),
              ),
              orderIntructions(),
              const SizedBox(height: 25),
              totalText(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: CustomButton(text: "Checkout", onPressed: () => null,),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget totalText(){
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total:',style:  TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),),
            priceText(txt: viewModel.getTotalText(),fontSize: 22.0)
          ],
        ),
    ),
    );
  }

  Widget orderIntructions(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0,vertical: 20),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Order Instructions',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey[800]),),
     const SizedBox(height: 8),
      TextFormField(
        keyboardType: TextInputType.multiline,
        minLines: 3,//Normal textInputField will be displayed
        maxLines: 5,// when user presses enter it will adapt to it
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 12.0),
          borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      ),
        ],
    ),
    );
  }

  Widget cartCountTxt(){
    return  Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 36.0),
        child: Text('${GlobalVars.cartList.length.toString()} items in cart',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
      ),
    );
  }



}
