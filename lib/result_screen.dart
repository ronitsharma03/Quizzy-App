import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {

  const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummarydata(){
    final List<Map<String, Object>> summary = [];


    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answer': chosenAnswer[i]
      });
    }
    return summary;
  }


  @override
  Widget build(context){
    final summaryData = getSummarydata();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data){
      return data['user_answer'] == data['correct_answers'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text('You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!',
               style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              QuestionsSummary(getSummarydata()),
              const SizedBox(height: 30,),
              TextButton.icon(
                icon: const Icon(Icons.refresh),
              onPressed: restartQuiz,
               label: const Text('Restart Quiz'),),

          ],
          ),
      ),
    );
  }
}