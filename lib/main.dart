import 'package:flutter/material.dart';

import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10 },
        {'text': 'Red', 'score': 5 },
        {'text': 'Green', 'score': 3 },
        {'text': 'White', 'score': 1 },
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 7 },
        {'text': 'Snake', 'score': 1 },
        {'text': 'Elephant', 'score': 4 },
        {'text': 'Lion', 'score': 10 },
      ]
    },
    {
      'questionText': 'What\'s your favorite programming language?',
      'answers': [
        {'text': 'Java', 'score': 1 },
        {'text': 'JavaScript', 'score': 1 },
        {'text': 'Python', 'score': 1 },
        {'text': 'C++', 'score': 1 },
      ]
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
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
