import 'package:amrajajabor_maps/app/constants/image_strings.dart';
import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import 'package:amrajajabor_maps/app/controllers/user_controller.dart';
import 'package:amrajajabor_maps/app/helpers/network_manager.dart';
import 'package:amrajajabor_maps/app/routes/app_pages.dart';
import 'package:amrajajabor_maps/app/utils/popups/full_screen_loader.dart';
import 'package:amrajajabor_maps/app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final userController = Get.put(UserController());

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.loadingIllustration,
      );
      final isConected = await NetworkManager.instance.isConnected();
      if (!isConected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthController.to.signInWithGoogle();

      await userController.saveUserRecord(userCredential);
      TFullScreenLoader.stopLoading();
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }
}
