import 'package:envanto/constants.dart';
import 'package:envanto/view_model/auth_view_model.dart';
import 'package:envanto/widgets/custom_button.dart';
import 'package:envanto/widgets/custom_social_buton.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:envanto/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_screen.dart';

class SignInScreen extends GetWidget<AuthViewModel> {
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
                Colors.black.withOpacity(.5), BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: height * .1, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
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
                        onTap: () => Get.to(SignUpScreen()),
                        child: CustomText(
                          title: 'Sign Up',
                          color: primaryColor4,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  CustomText(
                    title: 'Sign in to continue',
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 60,
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
                  CustomText(
                    title: 'Forget Password?',
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  Center(
                    child: CustomButton(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          controller.signInWithEmail();
                        }
                      },
                      height: 40,
                      width: width * .8,
                      title: 'SIGN IN',
                    ),
                  ),
                  SizedBox(
                    height: height * .1,
                    child: CustomText(
                      title: '-OR-',
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: CustomSocialButton(
                      onTap: () {
                        controller.signInWithFacebook();
                      },
                      height: 50,
                      width: width * .8,
                      image: 'images/facebook.png',
                      title: 'Sign in with Facebook',
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Center(
                    child: CustomSocialButton(
                      onTap: () {
                        controller.googleSignIn();
                      },
                      height: 50,
                      width: width * .8,
                      image: 'images/google.png',
                      title: 'Sign in with Google',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
