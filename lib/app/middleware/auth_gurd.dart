import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import '../routes/app_pages.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final user = AuthController.to.firebaseUser.value;

    final publicRoutes = [Routes.SIGNUP];

    // Case 1: Not logged in & trying to access private route
    if (user == null && !publicRoutes.contains(route)) {
      return const RouteSettings(name: Routes.SIGNUP);
    }

    // Case 2: Logged in & trying to access login/signup
    if (user != null && publicRoutes.contains(route)) {
      return const RouteSettings(name: Routes.HOME);
    }

    return null; // allow access
  }
}
