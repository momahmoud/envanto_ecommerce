import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:envanto/models/user_model.dart';

class DatabaseStore {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference _bestSellingCollection =
      FirebaseFirestore.instance.collection('best_selling_products');

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson());
  }

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollection.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSellingProducts() async {
    var value = await _bestSellingCollection.get();
    return value.docs;
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userCollection.doc(uid).get();
  }
}
