import 'package:amrajajabor_maps/app/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkManager>(NetworkManager());
    // Get.put<LocationManager>(LocationManager());
    // Get.put<ThemeController>(ThemeController());
  }
}
