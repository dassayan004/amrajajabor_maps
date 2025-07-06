import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  void logout() async {
    await AuthController.to.signOut();
    Get.offAllNamed(Routes.SIGNUP);
  }
}
