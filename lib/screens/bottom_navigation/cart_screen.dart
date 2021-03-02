import 'package:envanto/screens/cart/cart_list_item.dart';
import 'package:envanto/view_model/cart_view_model.dart';
import 'package:envanto/widgets/custom_bottom_sheet.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double top = Get.statusBarHeight - 40;
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => controller.cartModel.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/cart_empty.svg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  title: 'Cart Empty',
                  fontSize: 20,
                ),
              ],
            )
          : Scaffold(
              bottomSheet: CustomBottomSheet(
                buttonText: 'CHECKOUT',
                text: 'Total Price',
                price: '${controller.totalPrice}',
                space: .2,
              ),
              body: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding:
                    EdgeInsets.only(top: top, left: 10, right: 10, bottom: 50),
                itemCount: controller.cartModel.length,
                itemBuilder: (context, index) => CartListItem(
                  image: controller.cartModel[index].image,
                  name: controller.cartModel[index].name,
                  price: controller.cartModel[index].price,
                  quantity: controller.cartModel[index].quantity,
                  decrease: () {
                    controller.decreaseQuantity(index);
                  },
                  increase: () {
                    controller.increaseQuantity(index);
                  },
                ),
              ),
            ),
    );
  }
}
