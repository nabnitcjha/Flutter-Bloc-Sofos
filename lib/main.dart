import 'package:flutter/material.dart';
import 'package:crud_app/quiz.dart';
import 'package:crud_app/result.dart';
import 'package:crud_app/model/user.dart';
import 'package:crud_app/model/login.dart';
import 'package:crud_app/model/studentTeacher.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  var _myProfile={'title':'','userId':'','id':''};
  var _userName='';
  var _token='';
  var _teacherName='';
  var _userId=0;
  var _id=0;


  void _userProfile<t>(user){
    setState(() {
      _userName=user.title;
      _userId=user.userId;
      _id=user.id;
    });
  }

    void _proactiveLogin<t>(token){
    setState(() {
      _token=token;
    });
  }

    void _stuentTeacher<t>(techName){
    setState(() {
      _teacherName=techName;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

 _login() async {
  var email = 'Nick@John.Com';
  var password = '1234';
  final response = await http.post(
    Uri.parse('https://connect.proactivetutors.com/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  var body = jsonDecode(response.body);
  print('login_response $body');
  var accessToken = body['access_token'];
  _proactiveLogin(accessToken);
  // getStudentTeacher(accessToken);
}

_getStudentTeacher() async {
  var accessToken = _token;
  var studentId = 16;
  final url = Uri.parse(
      'https://connect.proactivetutors.com/api/getStudentTeachers/$studentId');
  final response = await http.get(url, headers: {
    'authorization': 'Bearer $accessToken',
  });
  var body = jsonDecode(response.body);
   var result= body['result'];
   var name = result['first_name']+' '+result['last_name'];
   print('result $name');
  _stuentTeacher(name);
}

 _testAPI() async{
  var usrPro = null;
   final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    usrPro = User.fromJson(jsonDecode(response.body));

    _userProfile(usrPro);
    print(_userName);
    print(_userId);
    print(_id);
  } else {
    throw Exception('Failed to load user');
  }
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
            : Result(_totalScore, _resetQuiz,_testAPI,_getStudentTeacher,_login,_userName,_token,_teacherName),
      ),
    );
  }
}
