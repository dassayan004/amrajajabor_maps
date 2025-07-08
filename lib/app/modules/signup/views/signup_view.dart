import 'package:amrajajabor_maps/app/constants/image_strings.dart';
import 'package:amrajajabor_maps/app/constants/sizes.dart';
import 'package:amrajajabor_maps/app/widgets/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/applogo.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(actions: [ThemeChangerDropDown()]),
      body: Stack(
        // Horizontally center
        children: [
          Positioned.fill(
            child: Image.asset(TImages.loginBg, fit: BoxFit.cover),
          ),
          Column(
            children: [
              const Expanded(flex: 6, child: SizedBox.expand()),

              // 🔹 Bottom section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(TSizes.cardRadiusLg),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, -2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppLogo(height: 100),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome to AmaraJajabor',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: controller.googleSignIn,
                        icon: Image.asset(TImages.google, height: 20),
                        label: const Text('Sign in with Google'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
