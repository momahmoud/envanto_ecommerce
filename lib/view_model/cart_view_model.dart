import 'package:envanto/models/cart_model.dart';
import 'package:envanto/services/offline_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllProduct();
  }
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartModel> _cartModel = [];
  List<CartModel> get cartModel => _cartModel;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  var offlineDbHelper = OfflineDatabaseHelper.db;

  addProductToCart(CartModel cartModel) async {
    for (var i = 0; i < _cartModel.length; i++) {
      if (_cartModel[i].productId == cartModel.productId) {
        return;
      }
    }

    await offlineDbHelper.insertToDb(cartModel);
    _cartModel.add(cartModel);
    _totalPrice += (double.tryParse(cartModel.price) * cartModel.quantity);

    update();
  }

  getAllProduct() async {
    _loading.value = true;

    _cartModel = await offlineDbHelper.getAllProductFromDb();
    print(_cartModel.length);
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _cartModel.length; i++) {
      _totalPrice +=
          (double.tryParse(_cartModel[i].price) * _cartModel[i].quantity);
      update();
    }
  }

  increaseQuantity(int index) async {
    _cartModel[index].quantity++;
    _totalPrice += (double.tryParse(_cartModel[index].price));
    await offlineDbHelper.updateProduct(_cartModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartModel[index].quantity == 0) {
      return;
    } else {
      _cartModel[index].quantity--;
      _totalPrice -= (double.tryParse(_cartModel[index].price));
      await offlineDbHelper.updateProduct(_cartModel[index]);
      update();
    }
  }
}
