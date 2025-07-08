import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/applogo.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: controller.scaleAnimation,
          child: AppLogo(height: 150),
        ),
      ),
    );
  }
}
