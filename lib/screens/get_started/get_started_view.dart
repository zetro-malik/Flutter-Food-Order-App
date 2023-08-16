import 'package:flutter/material.dart';
import 'package:food_order_ui/screens/bottom_navigation/bottom_navigation_view.dart';
import 'package:food_order_ui/widgets/scrollable_column.dart';
import 'package:get/get.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration:  BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            Colors.deepPurple[900]!.withOpacity(1.0),
            Colors.deepPurple[800]!.withOpacity(1.0),
            Colors.deepPurple[600]!.withOpacity(1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ScrollableColumn(

        children: [
          const Spacer(),
           Image(height: MediaQuery.of(context).size.height/2,image: AssetImage('asset/images/steak-removebg-preview.png')),
          const  Text('Enjoy',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 34),),
          const  SizedBox(height: 4),
          const  Text('Your Food',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 34)),
          const  SizedBox(height: 30),
          getStartedButton(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    ));
  }
  
  Widget getStartedButton(){
    return GestureDetector(
      onTap: () => Get.to( BottomNavigationView(),transition:Transition.rightToLeft ),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 32,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22)
        ),
        child: const Text('Get Started',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    );
  }
}
