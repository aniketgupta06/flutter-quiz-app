import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //first method to change the screen
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(changeScreen);
  //   super.initState();
  // }
  // void changeScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  var activeScreen = 'start-screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  //add selected options by the user to a list
  List<String> selectedOptions = [];

  void chooseOptions(String option){
    selectedOptions.add(option);

    setState(() {
      if(selectedOptions.length == questions.length){
        activeScreen = 'result-screen';
      }
    });
  }
  
  void restartQuiz() {
    setState(() {
      selectedOptions = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionScreen(chooseOptions); //add chooseOptions function to QuestionScreen
    }

    if(activeScreen == 'result-screen'){
      screenWidget = ResultScreen(selectedOptions, restartQuiz);
    }
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 99, 32, 214),
                Color.fromARGB(255, 47, 5, 119),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //first way
          //child: activeScreen,
          //second way
          child: screenWidget,
        ),
      ),
    );
  }
}
