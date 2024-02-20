import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String optionText;
  final void Function() onTap;

  const AnswerButton(this.optionText, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 54, 1, 75),
        foregroundColor: const Color.fromARGB(255, 246, 195, 255),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(optionText, textAlign: TextAlign.center,),
    );
  }
}
