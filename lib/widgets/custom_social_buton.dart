import 'package:envanto/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onTap;
  final String image;

  const CustomSocialButton({
    this.width,
    this.height,
    this.title,
    this.onTap,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          color: Colors.transparent,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            alignment: Alignment.center,
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: primaryColor3,
                  width: 1.2,
                )),
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  width: 50,
                  height: 25,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: width * .1,
                ),
                CustomText(
                  title: title,
                  color: primaryColor3,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  alignment: Alignment.center,
                ),
              ],
            )),
          ),
        ));
  }
}
