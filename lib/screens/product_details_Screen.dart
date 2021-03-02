import 'package:envanto/constants.dart';
import 'package:envanto/models/cart_model.dart';
import 'package:envanto/models/product_model.dart';
import 'package:envanto/view_model/cart_view_model.dart';
import 'package:envanto/widgets/custom_bottom_sheet.dart';

import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsScreen({
    Key key,
    this.productModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomSheet: GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => CustomBottomSheet(
          buttonText: 'ADD',
          price: productModel.price,
          text: 'PRICE',
          space: .3,
          onTap: () {
            controller.addProductToCart(CartModel(
              name: productModel.name,
              image: productModel.image,
              price: productModel.price,
              quantity: 1,
              productId: productModel.productId,
            ));
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  productModel.image,
                  width: width,
                  height: height * .44,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 0,
                  top: 80,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 80,
                  // bottom: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.star,
                          // size: 28,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        title: productModel.name,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            margin: EdgeInsets.all(0),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: 40,
                              width: width * .4,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: primaryColor2),
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                    title: 'Size:',
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  CustomText(
                                    title: productModel.size,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(0),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: 40,
                              width: width * .4,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: primaryColor2),
                              ),
                              child: Row(
                                children: [
                                  Container(),
                                  CustomText(
                                    title: 'Color:',
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    height: 18,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(),
                                      color: Color(productModel.color),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      CustomText(
                        title: 'Details',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        alignment: Alignment.topLeft,
                        title: productModel.description,
                        lineHeight: 1.6,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
