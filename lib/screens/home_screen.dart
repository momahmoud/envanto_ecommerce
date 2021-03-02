import 'package:envanto/constants.dart';
import 'package:envanto/view_model/home_view_model.dart';
import 'package:envanto/widgets/custom_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        backgroundColor: Colors.white,
        body: controller.currentScreen,
      ),
    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 55,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: BottomNavigationBar(
          // selectedItemColor: primaryColor1,
          currentIndex: controller.index,
          elevation: 0,
          onTap: (index) => controller.changeIndex(index),
          mouseCursor: MouseCursor.uncontrolled,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              activeIcon: CustomText(
                alignment: Alignment.bottomCenter,
                title: 'Explore',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor3,
              ),
              icon: Image.asset(
                'images/Icon_Explore.png',
                width: 25,
                height: 25,
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CustomText(
                title: 'Cart',
                fontSize: 20,
                color: primaryColor3,
                fontWeight: FontWeight.bold,
              ),
              icon: Image.asset(
                'images/Icon_Cart.png',
                width: 25,
                height: 25,
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CustomText(
                title: 'Profile',
                color: primaryColor3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              icon: Image.asset(
                'images/Icon_User.png',
                width: 25,
                height: 25,
                fit: BoxFit.fill,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
