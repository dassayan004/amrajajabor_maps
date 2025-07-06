import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Input controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var showPassword = false.obs;
  // Reactive state
  final isLoading = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var errorMessage = ''.obs;

  // Login method
  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Clear previous errors
    emailError.value = '';
    passwordError.value = '';

    // ✅ Validate fields
    bool hasError = false;

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      hasError = true;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Invalid email format';
      hasError = true;
    }

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      hasError = true;
    }

    if (hasError) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      await AuthController.to.signIn(email, password);
    } catch (e) {
      errorMessage.value = 'Login failed: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Clear previous errors
    emailError.value = '';
    passwordError.value = '';

    // ✅ Validate fields
    bool hasError = false;

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      hasError = true;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Invalid email format';
      hasError = true;
    }

    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      hasError = true;
    }

    if (hasError) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      await AuthController.to.signUp(email, password);
    } catch (e) {
      errorMessage.value = 'Login failed: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
