import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {

  final List<String> chosenOptions; 
  final void Function() onRestart;

  const ResultScreen(this.chosenOptions, this.onRestart, {super.key});

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    
    for(var i = 0; i < chosenOptions.length; i++){
      summary.add({
        'question_index': i,
        'question' : questions[i].question,
        'correct_answer': questions[i].options[0],
        'chosen_option': chosenOptions[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectGuesses = summaryData.where((data) {
      return data['correct-answer'] == data['chosen-option'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfCorrectGuesses out of $numberOfTotalQuestions questions correctly',
              style: GoogleFonts.sourceSerif4(
                color: const Color.fromARGB(255, 249, 214, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            ElevatedButton.icon(
              onPressed: onRestart,
              label: const Text('Restart Quiz!'),
              icon: const Icon(Icons.restart_alt_sharp),
            )
          ],
        ),
      ),
    );
  }
  
}