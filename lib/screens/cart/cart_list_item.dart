import 'package:envanto/constants.dart';

import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListItem extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final int quantity;
  final Function increase;
  final Function decrease;

  const CartListItem({
    Key key,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.decrease,
    this.increase,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = Get.size.height;
    double width = Get.size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        height: height * .17,
        width: width,
        child: Row(
          children: [
            Container(
              height: height * .3,
              width: width * .33,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: name,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    title: '\$$price',
                    color: primaryColor1,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      // color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: increase,
                          child: Icon(
                            Icons.add,
                            size: 22,
                            color: Colors.grey,
                          ),
                        ),
                        CustomText(
                          title: '$quantity',
                          color: primaryColor2,
                          fontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: decrease,
                          child: Icon(
                            Icons.remove,
                            size: 22,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
