import 'package:envanto/constants.dart';
import 'package:envanto/view_model/category_view_model.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              // color: primaryColor1,
              height: 90,
              child: ListView.builder(
                itemCount: controller.categoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Card(
                        shadowColor: primaryColor2,
                        margin: EdgeInsets.only(left: 3),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(
                            //   color: pri,
                            //   width: 1.5,
                            // ),
                          ),
                          child: Image.network(
                              controller.categoryModel[index].image),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        title: controller.categoryModel[index].name,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
