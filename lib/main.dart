import 'package:flutter/material.dart';
import 'package:crud_app/quiz.dart';
import 'package:crud_app/result.dart';

void main() => runApp(MyCoolApp());

class MyCoolApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCoolAppState();
}

class _MyCoolAppState extends State<MyCoolApp> {
  final _questions = const [
    {
      'questionText': 'Who is best developer in Sofos?',
      'answers': [
        {'text': 'Suman', 'score': 10},
        {'text': 'Bipin', 'score': 8},
        {'text': 'Balram', 'score': 6},
        {'text': 'Niraj', 'score': 4},
        {'text': 'Rimal', 'score': 2},
        {'text': 'Rajeev', 'score': 1}
      ],
    },
    {
      'questionText': 'Who is best designer in Sofos?',
      'answers': [
        {'text': 'Balram Karkee', 'score': 10},
        {'text': 'Niraj', 'score': 7},
        {'text': 'Bipin', 'score': 4},
        {'text': 'Rimal', 'score': 2}
      ],
    },
    {
      'questionText': 'Who is Manager in sofos?',
      'answers': [
        {'text': 'Rajeev Yadav', 'score': 7},
        {'text': 'Bikas Rimal', 'score': 5},
        {'text': 'Niraj', 'score': 3}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sofos Staff'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
