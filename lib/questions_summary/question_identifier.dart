import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final bool isCorrectAnswer;
  final int questionIndex;

  const QuestionIdentifier(this.isCorrectAnswer, this.questionIndex,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isCorrectAnswer
              ? const Color.fromARGB(255, 100, 255, 106)
              : Colors.redAccent,
          borderRadius: BorderRadius.circular(100),
          ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 14, 4, 24),
        ),
      ),
    );
  }
}
