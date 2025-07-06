import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignupView')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            children: [
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              if (controller.emailError.isNotEmpty)
                Text(
                  controller.emailError.value,
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 12),

              TextField(
                controller: controller.passwordController,
                obscureText: !controller.showPassword.value,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.showPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.showPassword.toggle(); // 👈 Toggle visibility
                    },
                  ),
                ),
              ),
              if (controller.passwordError.isNotEmpty)
                Text(
                  controller.passwordError.value,
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: controller.login,

                      child: Text("Login"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
