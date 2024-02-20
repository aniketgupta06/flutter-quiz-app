import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/klipartz.com.png',
          width: 300,
          // color: const Color.fromARGB(180, 250, 246, 255),
        ),
        const SizedBox(height: 50),
        const Text(
          'Test your anime knowledge!',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: startQuiz,
          label: const Text("Start Quiz"),
          icon: const Icon(Icons.arrow_right_alt),
        )
      ]),
    );
  }
}
