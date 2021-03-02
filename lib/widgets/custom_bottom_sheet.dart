import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomBottomSheet extends StatelessWidget {
  final String buttonText;
  final String price;
  final String text;
  final double space;
  final Function onTap;

  const CustomBottomSheet({
    Key key,
    this.buttonText,
    this.price,
    this.text,
    this.space,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.all(0),
      elevation: 20,
      child: Container(
        padding: EdgeInsets.only(left: 30, top: 8, right: 30, bottom: 5),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: text,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  title: '\$$price',
                  color: primaryColor3,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              width: width * space,
            ),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: CustomButton(
                onTap: onTap,
                height: 40,
                width: 50,
                title: buttonText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
