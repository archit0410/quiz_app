import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  /*alternatively you can do this const StartScreen(void Function() startQuiz, {super.key});,
  but you won't be able to use it in your build method*/


  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'lib/images/quiz-logo.png',
          width: 300,
        ),
        const SizedBox(
          height: 100,
        ),
        const Text("Learn flutter the fun way!",
            style: TextStyle(fontSize: 24, color: Colors.white)),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.all(10),
                textStyle: const TextStyle(fontSize: 20)),
            label: const Text("Start Quiz"))
      ]),
    );
  }
}
