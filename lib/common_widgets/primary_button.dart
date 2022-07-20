import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const PrimaryButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
