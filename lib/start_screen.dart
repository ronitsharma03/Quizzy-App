import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, 
      children: [
          Image.asset(
            'Assets/images/quiz-logo.png',
            height: 250,
            color: const Color.fromARGB(209, 255, 255, 255),
          ),
        
        const SizedBox(
          height: 70,
        ),
        Text(
          'Learn Flutter the Fun way!',
          style: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.white,
          )
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.deepPurple,
            backgroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text(
            'Start Quiz',
          ),
        ),
      ]),
    );
  }
}
