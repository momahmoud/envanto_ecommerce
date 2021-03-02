import 'package:envanto/view_model/profile_view_model.dart';
import 'package:envanto/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage: controller.userModel == null
                                  ? AssetImage('images/photo9.webp')
                                  : controller.userModel.pic == ''
                                      ? AssetImage('images/photo9.webp')
                                      : controller.userModel.pic,
                              radius: 40,
                            ),
                            Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: controller.userModel.name == null
                                      ? 'username'
                                      : controller.userModel.name,
                                ),
                                CustomText(
                                  title: controller.userModel.name == null
                                      ? 'username'
                                      : controller.userModel.email,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Center(
                      //   child: FlatButton(
                      //     child: Text('out'),
                      //     onPressed: () {
                      //       print(controller.userModel.name);
                      //       // controller.signOut();
                      //       // Get.offAll(SignInScreen());
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
