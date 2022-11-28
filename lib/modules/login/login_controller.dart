import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool eyesValue = true.obs;
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  Future<void> loginUser(String email, String password) async {
    final login = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
