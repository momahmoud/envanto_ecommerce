import 'package:envanto/models/category_model.dart';
import 'package:envanto/models/product_model.dart';
import 'package:envanto/services/database_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  CategoryViewModel() {
    getCategoryData();
    getBestSelling();
  }
  getCategoryData() async {
    _loading.value = true;
    DatabaseStore().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSelling() async {
    _loading.value = true;
    DatabaseStore().getBestSellingProducts().then((value) {
      for (var i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }
}
