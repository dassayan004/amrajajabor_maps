import 'package:amrajajabor_maps/app/controllers/auth_controller.dart';
import 'package:amrajajabor_maps/app/widgets/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/formatter.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final user = AuthController.to.firebaseUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [ThemeChangerDropDown()],
      ),
      body: Center(
        child: Obx(() {
          final currentUser = user.value;
          if (currentUser == null) {
            return const Text(
              'No user is logged in',
              style: TextStyle(fontSize: 20),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'User Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _infoRow(context, 'UID', currentUser.uid),
                _infoRow(context, 'Email', currentUser.email ?? 'N/A'),
                _infoRow(
                  context,
                  'Is Email Verified',
                  currentUser.emailVerified.toString(),
                ),
                _infoRow(
                  context,
                  'Creation Time',
                  TFormatter.formatDate(
                    currentUser.metadata.creationTime,
                    pattern: 'MMMM d, y – h:mm a',
                  ),
                ),
                _infoRow(
                  context,
                  'Last Sign-In',
                  TFormatter.formatDate(
                    currentUser.metadata.lastSignInTime,
                    pattern: 'MMMM d, y – h:mm a',
                  ),
                ),
              ],
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
        },
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}

Widget _infoRow(BuildContext context, String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    ),
  );
}
