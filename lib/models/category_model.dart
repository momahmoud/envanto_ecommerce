class CategoryModel {
  String name, image;

  CategoryModel({
    this.image,
    this.name,
  });
  CategoryModel.fromJson(Map<String, dynamic> data) {
    if (data == null) return;
    image = data['image'];
    name = data['name'];
  }

  toJson() {
    return {'image': image, 'name': name};
  }
}
