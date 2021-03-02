import 'package:envanto/screens/authentication/sign_%20in_screen.dart';
import 'package:envanto/screens/home_screen.dart';
import 'package:envanto/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeScreen()
          : SignInScreen();
    });
  }
}
