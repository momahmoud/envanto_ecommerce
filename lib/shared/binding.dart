import 'package:envanto/services/local_storage_data.dart';
import 'package:envanto/view_model/auth_view_model.dart';
import 'package:envanto/view_model/cart_view_model.dart';
import 'package:envanto/view_model/category_view_model.dart';
import 'package:envanto/view_model/home_view_model.dart';
import 'package:envanto/view_model/profile_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CategoryViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
  }
}
