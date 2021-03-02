import 'package:envanto/screens/bottom_navigation/cart_screen.dart';
import 'package:envanto/screens/bottom_navigation/explore_screen.dart';
import 'package:envanto/screens/bottom_navigation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _index = 0;
  get index => _index;

  Widget _currentScreen = ExploreScreen();
  get currentScreen => _currentScreen;

  void changeIndex(int newIndex) {
    _index = newIndex;
    switch (newIndex) {
      case 0:
        _currentScreen = ExploreScreen();
        break;
      case 1:
        _currentScreen = CartScreen();
        break;
      case 2:
        _currentScreen = ProfileScreen();
    }
    update();
  }
}
