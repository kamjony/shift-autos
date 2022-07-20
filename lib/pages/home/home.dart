import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shift_autos/common_widgets/primary_button.dart';
import 'package:shift_autos/controllers/auth_controller.dart';
import 'package:shift_autos/controllers/home_controller.dart';

class Home extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_controller.authController.fireStoreUser.value!.name),
            Text(_controller.authController.fireStoreUser.value!.photoUrl),
            Text(_controller.user.email ?? 'No email found'),
            PrimaryButton(
              label: 'Sign Out', onPressed: () { _controller.authController.signOut(); },

            ),
          ],
        ),
      ),
    );
  }
}
