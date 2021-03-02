import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onTap;

  const CustomButton({
    this.width,
    this.height,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: GradientColors.darkPink,
            ),
          ),
          child: Center(
            child: CustomText(
              title: title,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
