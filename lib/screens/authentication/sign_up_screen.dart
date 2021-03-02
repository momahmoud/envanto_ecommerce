import 'package:envanto/constants.dart';

import 'package:envanto/view_model/auth_view_model.dart';
import 'package:envanto/widgets/custom_button.dart';

import 'package:envanto/widgets/custom_text.dart';
import 'package:envanto/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_ in_screen.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/photo13.jpg',
            ),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.7), BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * .1, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Welcome',
                        color: primaryColor3,
                        fontSize: 33,
                        fontWeight: FontWeight.w700,
                      ),
                      InkWell(
                        onTap: () => Get.to(SignInScreen()),
                        child: CustomText(
                          title: 'Sign In',
                          color: primaryColor4,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    title: 'Create a new account',
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  CustomTextFormField(
                    onSaved: (val) => controller.name = val,
                    validator: (String val) {
                      if (val.trim().isEmpty) {
                        return 'name is empty';
                      }
                      if (val.trim().length < 3) {
                        return 'name is less than 3 chars';
                      }
                    },
                    text: 'Name',
                    hint: 'username',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextFormField(
                    onSaved: (val) => controller.email = val,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'Email is empty';
                      }
                      if (!val.contains('@')) {
                        return 'invalid email, example@gmail.com';
                      }
                      if (val.trim().contains(' ')) {
                        return 'invalid email, no spaces';
                      }
                    },
                    text: 'Email',
                    hint: 'example@gmail.com',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextFormField(
                    onSaved: (val) => controller.password = val,
                    validator: (String val) {
                      if (val.trim().isEmpty) {
                        return 'Password is empty';
                      }
                      if (val.trim().length < 6) {
                        return 'Password is less than 6 chars';
                      }
                    },
                    text: 'Password',
                    hint: 'at least 3 chars',
                    icon: Icons.visibility_off_outlined,
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  Center(
                    child: CustomButton(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          controller.signUnWithEmail();
                        }
                      },
                      height: 40,
                      width: width * .8,
                      title: 'SIGN UP',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
