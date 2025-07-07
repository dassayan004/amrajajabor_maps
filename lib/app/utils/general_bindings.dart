import 'package:amrajajabor_maps/app/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put<AuthController>(AuthController());
    Get.put<NetworkManager>(NetworkManager());
    // Get.put<ThemeController>(ThemeController());
  }
}
