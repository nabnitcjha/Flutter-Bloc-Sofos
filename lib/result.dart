import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final String token;
  final String teacherName;
  final VoidCallback resetQuiz;
final VoidCallback testAPI;
final VoidCallback login;
final VoidCallback getStudentTeacher;

  var userName;
  
  Result(this.resultScore, this.resetQuiz,this.testAPI,this.getStudentTeacher,this.login,this.userName,this.token,this.teacherName);

    String get resultPhrase {
    String resultText;
    if (resultScore > 26) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore > 20) {
      resultText = 'Pretty likeable!';
    } else if (resultScore > 10) {
      resultText = 'Need to improve your skill!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }
  


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text('Reset Quiz!'),
          ),
           TextButton(
            onPressed: testAPI,
            child: Text('API TEST!'),
          ),
          TextButton(
            onPressed: login,
            child: Text('Proactive Login'),
          ),
          TextButton(
            onPressed: getStudentTeacher,
            child: Text('Student Teacher'),
          ),
          Text(
            userName,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            teacherName,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            token,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
