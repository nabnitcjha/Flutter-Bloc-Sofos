import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
final VoidCallback testAPI;

  var userName;
  
  Result(this.resultScore, this.resetQuiz,this.testAPI,this.userName);

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
          Text(
            userName,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          
        ],
      ),
    );
  }
}
