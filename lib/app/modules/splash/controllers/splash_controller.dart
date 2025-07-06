import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutBack,
    );

    animationController.forward();

    // Reactive auth state handling
    ever(AuthController.to.firebaseUser, (user) {
      if (user != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.SIGNUP);
      }
    });

    // Optionally, trigger the first value after splash delay
    Future.delayed(const Duration(seconds: 3), () {
      final user = AuthController.to.firebaseUser.value;
      if (user != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.SIGNUP);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
