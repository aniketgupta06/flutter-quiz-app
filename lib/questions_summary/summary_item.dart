import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;
  const SummaryItem(this.itemData, {super.key});
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['correct_answer'] == itemData['chosen_option'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer,
            itemData['question_index'] as int,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemData['question'].toString(),
                    style: GoogleFonts.bitter(
                      color: const Color.fromARGB(255, 248, 210, 255),
                      fontSize: 17,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData['correct_answer'] as String,
                  style: GoogleFonts.crimsonText(
                    color: isCorrectAnswer
                        ? const Color.fromARGB(255, 200, 179, 204)
                        : const Color.fromARGB(255, 250, 180, 175),
                    fontSize: 15,
                  ),
                ),
                Text(
                  itemData['chosen_option'] as String,
                  style: GoogleFonts.crimsonText(
                    color: const Color.fromARGB(255, 143, 248, 174),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
