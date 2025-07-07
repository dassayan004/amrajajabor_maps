import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

class ThemeChangerDropDown extends StatelessWidget {
  const ThemeChangerDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      final mode = themeController.themeMode;

      IconData currentIcon;
      switch (mode) {
        case ThemeMode.light:
          currentIcon = Icons.light_mode;
          break;
        case ThemeMode.dark:
          currentIcon = Icons.dark_mode;
          break;
        case ThemeMode.system:
          currentIcon = Icons.settings;
          break;
      }

      return PopupMenuButton<ThemeMode>(
        tooltip: 'Change Theme',
        icon: Icon(currentIcon),
        initialValue: mode,
        onSelected: (mode) => themeController.setTheme(mode),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: ThemeMode.light,
            child: ListTile(
              leading: const Icon(Icons.light_mode),
              title: Text(
                'Light',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          PopupMenuItem(
            value: ThemeMode.dark,
            child: ListTile(
              leading: const Icon(Icons.dark_mode),
              title: Text(
                'Dark',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          PopupMenuItem(
            value: ThemeMode.system,
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                'System',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      );
    });
  }
}
