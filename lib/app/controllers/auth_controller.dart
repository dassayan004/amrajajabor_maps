import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // Bind Firebase auth stream
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      final user = AuthController.to.firebaseUser.value;
      Get.snackbar(
        'Login Successful',
        'Welcome ${user?.email}!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: TColors.success,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Login Failed', e.message ?? 'An unknown error occurred');
    } catch (e) {
      Get.snackbar('Login Failed', 'Unexpected error: ${e.toString()}');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = AuthController.to.firebaseUser.value;

      Get.snackbar(
        'Signed up successfully',
        'Welcome ${user?.email}!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: TColors.success,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Signup Failed', e.message ?? 'An unknown error occurred');
    } catch (e) {
      Get.snackbar('Signup Failed', 'Unexpected error: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
