class CartModel {
  String name, image, price, productId;
  int quantity;

  CartModel({
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.productId,
  });

  CartModel.fromJson(Map<String, dynamic> data) {
    if (data == null) return;
    name = data['name'];
    quantity = data['quantity'];
    image = data['image'];
    price = data['price'];
    productId = data['productId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
