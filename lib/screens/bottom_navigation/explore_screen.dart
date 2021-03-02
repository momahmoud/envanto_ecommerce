import 'package:envanto/screens/best_selling/best_selling_list.dart';
import 'package:envanto/screens/categories/category_list.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ExploreScreen extends StatelessWidget {
  final List<String> bestImage = [
    'images/Image.png',
    'images/chaire.png',
  ];
  final List<String> bestTitle = [
    'BeoPlay Speaker',
    'Leather Wristwatch',
  ];
  final List<String> besdesc = [
    'Bang and Olufsen',
    'Tag Heuer',
  ];
  @override
  Widget build(BuildContext context) {
    double width = Get.size.width;
    double height = Get.size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.033, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: primaryColor2,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey.withOpacity(.09),
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            CustomText(
              title: 'Categories',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            SizedBox(
              height: 25,
            ),
            CategoryList(),
            SizedBox(
              height: height * .06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Best Selling',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                CustomText(
                  title: 'See all',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: primaryColor3,
                ),
              ],
            ),
            BestSellingList(
              height: height * .5,
              width: width,
            )
          ],
        ),
      ),
    );
  }
}
