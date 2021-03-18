import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trulseapp/model/question.dart';

class TrulsePage extends StatefulWidget {
  @override
  _TrulsePageState createState() => _TrulsePageState();
}

class _TrulsePageState extends State<TrulsePage> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question(
        "20th-century Filipino electrician Agapito Flores invented the fluorescent lamp.",
        false),
    Question(
        "General MacArthur kept his promise and returned with a massive amphibious force on the island of Leyte in October of 1944.",
        true),
    Question(
        "Princess Urduja who ruled an island called Tawalisi in the 14th century is a Filipino Heroine.",
        false),
    Question("The yo-yo was invented by ancient Filipinos.", false),
    Question(
        "The Philippines were claimed in the name of Spain in 1521 by Ferdinand Magellan, a Portuguese explorer sailing for Spain.",
        true),
    Question("Fernando Poe Sr. served as the model for the Oblation.", false),
    Question(
        "The viral love letter “Liham Para Kay Oryang” was written by Andres Bonifacio.",
        false),
    Question(
        "Rizal proclaimed the Philippines \"the Pearl of the Oriental Seas\".",
        true),
    Question("Jose Rizal wrote “Sa Aking Mga Kabata” in his childhood.", false),
    Question(
        "Philippines had transformed from a Commonwealth to an independent republic in 1946.",
        true),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'img/flag.jpg',
              width: 250,
              height: 180,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.blueGrey.shade400,
                    style: BorderStyle.solid,
                  )),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${questionBank[_currentQuestionIndex].questionText}',
                    // style: TextStyle(
                    //   fontSize: 16.0,
                    //   fontWeight: FontWeight.normal,
                    //   color: Colors.white,
                    // ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildElevatedButtonIcon(Icon(Icons.arrow_back), _prevQuestion),
              _buildElevatedButton(
                userChoice: true,
                labelChoice: 'TRUE',
                buttonColor: Colors.blueGrey.shade900,
              ),
              _buildElevatedButton(
                userChoice: false,
                labelChoice: 'FALSE',
                buttonColor: Colors.blueGrey.shade900,
              ),
              _buildElevatedButtonIcon(
                  Icon(Icons.arrow_forward), _nextQuestion),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  ElevatedButton _buildElevatedButtonIcon(Icon navIcon, _navQuestion) {
    return ElevatedButton(
      onPressed: _navQuestion,
      child: navIcon,
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey.shade900,
      ),
    );
  }

  ElevatedButton _buildElevatedButton({
    bool userChoice,
    String labelChoice,
    Color buttonColor,
  }) {
    return ElevatedButton(
      onPressed: () => _checkAnswer(userChoice),
      child: Text('$labelChoice'),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
      ),
    );
  }

  void _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint('Yes Correct!');

      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Yes Correct!'),
        backgroundColor: Colors.greenAccent.shade700,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    } else {
      debugPrint('Incorrect!');
      final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Incorrect!'),
        backgroundColor: Colors.redAccent.shade700,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }

  // void _updateQuestion() {
  //   setState(() {
  //     _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
  //   });
  // }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questionBank.length - 1) {
        _currentQuestionIndex++;
      } else {
        debugPrint('I AM GOING TO Randomize QUESTION!!!');
        _randomQuestion();
      }
    });
  }

  void _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  void _randomQuestion() {
    setState(() {
      _currentQuestionIndex = _randomNumber() - 1;
    });
  }

  int _randomNumber() {
    return Random().nextInt(questionBank.length) + 1;
  }
}
