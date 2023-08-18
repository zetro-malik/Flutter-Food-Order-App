import 'package:flutter/material.dart';
import 'package:food_order_ui/helper/global_vars.dart';
import 'package:food_order_ui/screens/cart/cart_model.dart';
import 'package:food_order_ui/screens/cart/cart_viewmodel.dart';
import 'package:food_order_ui/screens/menu/menu_viewmodel.dart';
import 'package:food_order_ui/screens/product_detail/product_detail_viewmodel.dart';
import 'package:food_order_ui/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class SearchCard extends StatelessWidget {
  final int index;
  final dynamic viewModel;

  const SearchCard({Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? 100
          : 150,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Hero(
                  tag: viewModel.products.value[index].image,
                  child: Image.asset(
                    viewModel.products.value[index].image,
                    height: 150,
                    width: 150,
                  ))),
          const SizedBox(height: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  viewModel.products.value[index].name!,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(
                  viewModel.products.value[index].description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 10),
                getStarRating(viewModel.products.value[index].rating),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    priceText(
                        txt: viewModel.products.value[index].price!, fontSize: 18.0),
                    InkWell(
                      onTap: () {
                        GlobalVars.cartList.value.add(CartItem(
                            viewModel.products.value[index],
                            viewModel.products.value[index].price,
                            1));
                        GlobalVars.cartList.refresh();
                        HapticFeedback.lightImpact();
                      },
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget getStarRating(double rating) {
    int numStars = rating.floor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < numStars) {
          return Icon(Icons.star, color: Colors.yellow[800]);
        } else if (index == numStars && rating - numStars >= 0.5) {
          return Icon(Icons.star_half, color: Colors.yellow[800]);
        } else {
          return Icon(Icons.star_border, color: Colors.yellow[800]);
        }
      }),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final int index;
  const CartItemCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 140,
          width: 90,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            GlobalVars.cartList.value[index].product.image!,
            scale: 1.2,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      GlobalVars.cartList.value[index].product.name!,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        GlobalVars.removeItem(index);
                        HapticFeedback.selectionClick();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: priceText(
                    txt: GlobalVars.cartList.value[index].price!,
                    fontSize: 12.0),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        HapticFeedback.vibrate();
                        GlobalVars.subtractCounter(index);
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: Colors.deepPurple,
                      )),
                  const SizedBox(width: 16),
                  Text(
                    GlobalVars.cartList.value[index].quantity.toString(),
                    style:
                        const TextStyle(color: Colors.deepPurple, fontSize: 18),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                      onPressed: () {
                        GlobalVars.addCounter(index);
                        HapticFeedback.vibrate();
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.deepPurple,
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TabBarCard extends StatelessWidget {
  final int index;
  final dynamic viewModel;

  const TabBarCard({Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (viewModel.selectedTab.value == index) {
              return;
            }
            viewModel.updateSelectTab(index);
          },
          child: Obx(
            () => Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  color: viewModel.selectedTab.value == index
                      ? Colors.deepPurple
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                viewModel.tabViewItems[index]['img']!,
                scale: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          viewModel.tabViewItems[index]['name']!,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

class AddOns extends StatelessWidget {
  final int index;
  final ProductDetailViewModel viewModel;

  const AddOns({Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).orientation == Orientation.portrait ? 80 : 150,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.asset(
            viewModel.addOns[index]['image'],
            height: 60,
          )),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GridCard extends StatelessWidget {
  final int index;
  final MenuModel viewModel;

  const GridCard({Key? key, required this.index, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? 100
          : 150,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Hero(
                  tag: viewModel.products[index].image,
                  child: Image.asset(
                    viewModel.products[index].image,
                    height: 120,
                  ))),
          const SizedBox(height: 5),
          Text(
            viewModel.products[index].name!,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              priceText(txt: viewModel.products[index].price!),
              InkWell(
                onTap: () {
                  GlobalVars.cartList.value.add(CartItem(
                      viewModel.products[index],
                      viewModel.products[index].price,
                      1));
                  GlobalVars.cartList.refresh();
                  HapticFeedback.lightImpact();
                },
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

Text priceText({txt, fontSize = 14.0}) {
  return Text('\$${txt.toString()}',
      style: TextStyle(
          color: Colors.yellow[800],
          fontSize: fontSize,
          fontWeight: FontWeight.bold));
}
