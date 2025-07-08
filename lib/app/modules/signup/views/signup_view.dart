import 'package:amrajajabor_maps/app/constants/image_strings.dart';
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
      appBar: AppBar(actions: [ThemeChangerDropDown()]),
      body: Center(
        // Horizontally center
        child: SingleChildScrollView(
          // Enables scrolling on small screens
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(height: 150),
              SizedBox(height: 20),
              //Texts and Styling of them
              Text(
                'Welcome to AmaraJajabor !',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                'A one-stop portal for you to learn the latest technologies from SCRATCH',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              SizedBox(
                // 👈 Makes it full width
                child: OutlinedButton.icon(
                  onPressed: controller.googleSignIn,
                  icon: Image.asset(TImages.google, height: 20),
                  label: const Text('Sign in with Google'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
