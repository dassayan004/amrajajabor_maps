import 'package:amrajajabor_maps/app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:amrajajabor_maps/app/utils/exceptions/firebase_exceptions.dart';
import 'package:amrajajabor_maps/app/utils/exceptions/format_exceptions.dart';
import 'package:amrajajabor_maps/app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/colors.dart';
import '../routes/app_pages.dart';

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

  @override
  void onReady() {
    super.onReady();
    ever(firebaseUser, handleAuthChanged);
  }

  Future<void> handleAuthChanged(User? user) async {
    if (user != null) {
      Get.offAllNamed(Routes.HOME); // 🔁 User logged in → go to home
    } else {
      Get.offAllNamed(Routes.SIGNUP); // 🔁 User logged out or not logged in
    }
  }

  /*------------------------------- email pass Sign in -------------------------------*/

  /// signin
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // final user = AuthController.to.firebaseUser.value;
      // Get.snackbar(
      //   'Login Successful',
      //   'Welcome ${user?.email}!',
      //   backgroundColor: TColors.success,
      //   colorText: Colors.white,
      // );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// signup
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
        backgroundColor: TColors.success,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Signup Failed',
        e.message ?? 'An unknown error occurred',
        backgroundColor: TColors.error,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Signup Failed',
        'Unexpected error: ${e.toString()}',
        backgroundColor: TColors.error,
        colorText: Colors.white,
      );
    }
  }

  /*------------------------------- Google Sign in -------------------------------*/

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
