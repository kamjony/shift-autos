import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shift_autos/common_widgets/primary_button.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Please verify your email to access Shift Autos'),
              SizedBox(height: 30),
              PrimaryButton(label: 'Go To Sign In', onPressed: () async {
                Get.offNamed('/sign_in');
              }),

            ],
          ),
        ),
      ),
    );
  }
}
