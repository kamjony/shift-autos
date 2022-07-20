import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shift_autos/common_widgets/form_input_field.dart';
import 'package:shift_autos/common_widgets/form_vertical_space.dart';
import 'package:shift_autos/common_widgets/label_button.dart';
import 'package:shift_autos/common_widgets/primary_button.dart';
import 'package:shift_autos/constants/validators.dart';
import 'package:shift_autos/controllers/auth_controller.dart';

class SignIn extends StatelessWidget {
  final AuthController _controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignIn({Key? key}) : super(key: key);

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
                FormInputField(
                    controller: _passwordController,
                    labelText: 'Password',
                    iconPrefix: Icons.lock,
                    obscureText: true,
                    validator: Validator().password,
                    onChanged: (value) => {},
                    onSaved: (value) => _passwordController.text = value!),
                FormVerticalSpace(),
                PrimaryButton(label: 'Sign In', onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _controller.login(_emailController.text.trim(), _passwordController.text.trim());
                  }
                }),
                FormVerticalSpace(),
                LabelButton(label: 'Forgot Password?', onPressed: () => Get.toNamed('/forgot_password')),
                LabelButton(label: "Don't have an account?", onPressed: () => Get.toNamed('/sign_up')),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
