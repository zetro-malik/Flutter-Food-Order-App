import 'package:flutter/material.dart';
import 'package:food_order_ui/widgets/scrollable_column.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ScrollableColumn(
          children: [
            const SizedBox(height: 30),
             profileSection(),
            const SizedBox(height: 20),
            profileTxt(),
            const SizedBox(height: 20),
            section1(),
            section2(),
            sectionLogout(),

          ],
        ) 
    );
  }

  Widget section1(){
    return cardContainer(
        Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sectionBar(const Icon(Icons.person,color: Colors.grey,),"Profile Settings"),
        const SizedBox(height: 25),
        sectionBar(const Icon(Icons.credit_card,color: Colors.grey,),"Payment Methods"),
        const SizedBox(height: 25),
        sectionBar(const Icon(Icons.pin_drop,color: Colors.grey,),"Address"),

      ],
    ));
  }





  Widget section2(){
    return cardContainer(Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sectionBar(const Icon(Icons.favorite,color: Colors.grey,),"Favorite Order"),
        const SizedBox(height: 25),
        sectionBar(const Icon(Icons.checklist,color: Colors.grey,),"My Order"),
        const SizedBox(height: 25),
        sectionBar(const Icon(Icons.language,color: Colors.grey,),"Language"),
        const SizedBox(height: 25),
        sectionBar(const Icon(Icons.settings,color: Colors.grey,),"Settings"),
        const SizedBox(height: 25),
        sectionBar(const Icon(Icons.notifications,color: Colors.grey,),"Notifications"),


      ],
    ));
  }



  Widget sectionLogout(){
    return cardContainer(
      sectionBar(const Icon(Icons.logout_rounded,color: Colors.grey,),"Log Out"),
    );
  }

  Widget cardContainer(Widget colm){
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 12 ),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12 ),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), // Shadow color
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(-3, 3), // Shadow position (horizontal, vertical)
            ),
          ],
        ),
        child:colm
    );
  }



  Widget sectionBar(Icon icon,String txt){
    return Row(
      children: [
        icon,
        const SizedBox(width: 12),
        Text(txt,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
        const Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.arrow_forward_ios)
          ],
        ))
      ],
    );
  }







  Widget profileTxt(){
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Zeeshan Azhar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pin_drop,color: Colors.grey,size: 16,),
            Text("Islamabad, Pakistan",style: TextStyle(color: Colors.grey),)
          ],
        )
      ],
    );
  }

  Widget profileSection(){
    return const Align(
      alignment: Alignment.center,
      child:  CircleAvatar(
        backgroundImage: AssetImage("asset/images/fries.png"),
      radius: 35,
      ),
    );
  }


}
