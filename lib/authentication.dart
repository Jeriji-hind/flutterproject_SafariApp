import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project/loginpage.dart';
import 'package:project/profile.dart';

class Authentication extends GetxController {
  static Authentication instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initscreen);
  }

  _initscreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.offAll(() => loginpage());
    } else {
      Get.offAll(() => profile());
    }
  }

  Future<void> register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About user ", "User message",
          backgroundColor: Color.fromARGB(255, 107, 49, 49),
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Invalid information , try again ! ",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  Future<void> login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About login ", "login message",
          backgroundColor: Color.fromARGB(255, 107, 49, 49),
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed, try again ! ",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
