class UserModel {
  String userId, email, name, pic;

  UserModel({
    this.userId,
    this.email,
    this.name,
    this.pic,
  });

  UserModel.formJson(Map<dynamic, dynamic> data) {
    if (data == null) return;
    userId = data['userId'];
    email = data['email'];
    name = data['name'];
    pic = data['pic'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
