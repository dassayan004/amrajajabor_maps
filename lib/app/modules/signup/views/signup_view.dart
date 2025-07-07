import 'package:amrajajabor_maps/app/widgets/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [ThemeChangerDropDown()]),
      body: Center(
        // Horizontally center
        child: SingleChildScrollView(
          // Enables scrolling on small screens
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [FlutterLogo(size: 80)],
                ),
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    spacing: 12,

                    children: [
                      TextField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(labelText: "Email"),
                      ),
                      if (controller.emailError.isNotEmpty)
                        Text(
                          controller.emailError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
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
                            onPressed: controller.showPassword.toggle,
                          ),
                        ),
                      ),
                      if (controller.passwordError.isNotEmpty)
                        Text(
                          controller.passwordError.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.login,

                        child: controller.isLoading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : const Text("Login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
