import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectOption;

  const QuestionScreen(this.onSelectOption, {super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{
  var currQuestionIndex = 0;

  //we want onSelectAnswer function in this state, which is currently present in widget
  //because we want to execute that function when the button is pressed
  void answerQuestion(String selectedOption) {
    //we get widget functionality provided in state class by flutter for this purpose
    widget.onSelectOption(selectedOption);
    setState(() {
      currQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.robotoSlab(
                color: const Color.fromARGB(255, 227, 196, 252),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40,),
            //take each option from the list and convert it into Answerbutton and put it in 
            //this column widget along with other children
            ...currentQuestion.getShuffledOptions().map((option) {
              return AnswerButton(
                option,
                () =>
                  answerQuestion(option)
                );
            }),
          ],
        ),
      ),
    );
  }
}