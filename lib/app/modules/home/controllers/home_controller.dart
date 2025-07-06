import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void logout() async => await AuthController.to.signOut();
}
