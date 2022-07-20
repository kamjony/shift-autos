import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {

  final String label;
  final void Function() onPressed;

  const LabelButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        label,
      ),
      onPressed: onPressed,
    );
  }
}