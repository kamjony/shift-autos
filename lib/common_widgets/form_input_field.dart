import 'package:flutter/material.dart';
import 'package:shift_autos/constants/app_colors.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? iconPrefix;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

  const FormInputField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.validator,
      this.iconPrefix,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      required this.onChanged,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.circular(8.0)),
          filled: true,
          prefixIcon: iconPrefix == null ? null : Icon(iconPrefix),
          fillColor: Colors.white38,
          labelStyle: TextStyle(color: AppColors.black),
          labelText: labelText),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: 1,
      minLines: minLines,
      validator: validator,
    );
  }
}
