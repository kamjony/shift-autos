import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shift_autos/common_widgets/form_input_field.dart';
import 'package:shift_autos/common_widgets/form_vertical_space.dart';
import 'package:shift_autos/common_widgets/primary_button.dart';
import 'package:shift_autos/constants/validators.dart';
import 'package:shift_autos/controllers/auth_controller.dart';

class ForgotPassword extends StatelessWidget {
  final AuthController _controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormInputField(
                    controller: _emailController,
                    labelText: 'Email',
                    iconPrefix: Icons.email,
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => {},
                    onSaved: (value) => _emailController.text = value!),
                FormVerticalSpace(),

                PrimaryButton(label: 'Reset Password', onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _controller.resetPassword(_emailController.text.trim());
                  }
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
