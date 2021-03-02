import 'package:envanto/constants.dart';
import 'package:envanto/screens/product_details_Screen.dart';

import 'package:envanto/view_model/category_view_model.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellingList extends StatelessWidget {
  final double height;
  final double width;

  const BestSellingList({
    Key key,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Container(
              height: height,
              width: width,
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              height: height,
              width: width,
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                itemCount: controller.productModel.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Get.to(ProductDetailsScreen(
                      productModel: controller.productModel[index],
                    ));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, right: 15, left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(0),
                          elevation: 10,
                          shadowColor: Colors.white,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  controller.productModel[index].image,
                                  height: height - 80,
                                  width: width / 2.1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Card(
                                  margin: EdgeInsets.all(0),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    // side: BorderSide(color: primaryColor3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CustomText(
                                      title:
                                          '\$${controller.productModel[index].price}',
                                      color: primaryColor3,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          title: controller.productModel[index].name,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          title: controller.productModel[index].subDescription,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
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
