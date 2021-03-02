import 'package:flutter/material.dart';

class ProductModel {
  String name, description, image, price, size, subDescription, productId;
  int color;

  ProductModel({
    this.color,
    this.description,
    this.image,
    this.name,
    this.price,
    this.size,
    this.subDescription,
    this.productId,
  });

  ProductModel.fromJson(Map<String, dynamic> data) {
    if (data == null) return;
    name = data['name'];
    description = data['description'];
    image = data['image'];
    price = data['price'];
    size = data['size'];
    color = data['color'];
    subDescription = data['subDescription'];
    productId = data['productId'];
  }
  toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'size': size,
      'color': color,
      'subDescription': subDescription,
      'productId': productId,
    };
  }
}
