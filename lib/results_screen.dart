import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_list.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/questionSummary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    //so basically it is a list of Maps
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numTotalQuestions out of $numCorrectQuestions questions correctly!',
              style: const TextStyle(color: const Color.fromARGB(255, 255, 255, 255,), fontSize: 18), textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: getSummaryData()),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.restart_alt_sharp) ,label: Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}
