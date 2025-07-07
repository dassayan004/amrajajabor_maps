import 'package:amrajajabor_maps/app/controllers/theme_controller.dart';
import 'package:amrajajabor_maps/app/env/env.dart';
import 'package:amrajajabor_maps/app/utils/general_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
import 'controllers/auth_controller.dart';
import 'routes/app_pages.dart';
import 'themes/theme.dart';

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.getEnvFileName());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthController()));
  await GoogleFonts.pendingFonts([
    GoogleFonts.dmSans(),
    GoogleFonts.secularOne(),
  ]);
  await GetStorage.init(); // ✅ Add this
  Get.put(ThemeController());
  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        defaultTransition: Transition.fadeIn,
        initialBinding: GeneralBindings(),
        themeMode: ThemeController.to.themeMode,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
