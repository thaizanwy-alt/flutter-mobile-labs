import 'package:flutter/material.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// -------------------- Question Model --------------------

class Question {
  final String questionText;
  final bool answer;

  Question(this.questionText, this.answer);
}

// -------------------- QuizPage --------------------------

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> _questions = [
    Question('Whales are the largest fish in the world.', false),
    Question('Water boils at 100°C under normal conditions.', true),
    Question('Humans have five senses.', true),
    Question('The Moon produces its own light like the Sun.', false),
  ];

  int _currentQuestionIndex = 0;
  List<Icon> _scoreKeeper = [];

  void _checkAnswer(bool userAnswer) {
    bool correctAnswer = _questions[_currentQuestionIndex].answer;

    setState(() {
      if (userAnswer == correctAnswer) {
        _scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        _scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Show dialog
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Completed Game!'),
            content: const Text('You have answered all questions.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetQuiz();
                },
                child: const Text('Start over'),
              ),
            ],
          ),
        );
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _scoreKeeper.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    String questionText = _questions[_currentQuestionIndex].questionText;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'True',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () => _checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'False',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () => _checkAnswer(false),
            ),
          ),
        ),
        Row(
          children: _scoreKeeper,
        )
      ],
    );
  }
}
