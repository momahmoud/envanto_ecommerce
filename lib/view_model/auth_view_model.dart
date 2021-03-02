import 'package:envanto/models/user_model.dart';
import 'package:envanto/screens/controll_screen.dart';
import 'package:envanto/services/database_store.dart';
import 'package:envanto/services/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;
  final LocalStorageData localStorageData = Get.find();
  Rx<User> _user = Rx<User>();
  get user => _user.value?.email;
  // Rx<bool> _isSeen = Rx<bool>();
  // get isSeen => _isSeen;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    // seen();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // seen() {
  //   isSeen.value = !isSeen;
  //   update();
  // }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
        Get.offAll(ControlScreen());
      });
    } catch (e) {
      Get.snackbar(
        'login error',
        e.message,
        backgroundColor: Colors.black,
        colorText: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
      final accessToken = result.accessToken.token;
      if (result.status == FacebookLoginStatus.loggedIn) {
        final FacebookAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken);
        await _auth
            .signInWithCredential(facebookAuthCredential)
            .then((user) async {
          saveUser(user);
          Get.offAll(ControlScreen());
        });
      }
    } catch (e) {
      Get.snackbar(
        'login error',
        e.message,
        backgroundColor: Colors.black,
        colorText: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signInWithEmail() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await DatabaseStore().getCurrentUser(value.user.uid).then((value) {
          setUser(UserModel.formJson(value.data()));
          print(value.data());
        });
      });
      Get.snackbar(
        'Registeration successfully ',
        'Welcome,',
        backgroundColor: Colors.black,
        colorText: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(ControlScreen());
    } catch (e) {
      Get.snackbar(
        'login error',
        e.message,
        backgroundColor: Colors.black,
        colorText: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signUnWithEmail() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.snackbar(
        'Registeration successfully ',
        'Welcome, $name',
        backgroundColor: Colors.black,
        colorText: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(ControlScreen());
    } catch (e) {
      Get.snackbar(
        'login error',
        e.message,
        backgroundColor: Colors.black,
        colorText: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    );
    await DatabaseStore().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
