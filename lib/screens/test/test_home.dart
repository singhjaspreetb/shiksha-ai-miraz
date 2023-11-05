import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shikshamiraz/screens/test/util/testresult.dart';

class TestHome extends StatefulWidget {
  final Map<String, Map<String, dynamic>> questions;
  final int questionTimeLimit;

  const TestHome({
    Key? key,
    required this.questions,
    this.questionTimeLimit = 1, // in minutes
  }) : super(key: key);

  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  int _currentQuestionIndex = 1;
  Timer? _timer;
  int _remainingSeconds = 0;
  int _score = 0;
  List<int> _timeTakenPerQuestion = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay for demonstration purposes.
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _startQuestionTimer();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startQuestionTimer() {
    _remainingSeconds = widget.questionTimeLimit * 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_remainingSeconds <= 0) {
          _goToNextQuestion();
        } else {
          _remainingSeconds--;
        }
      });
    });
  }

  void _goToNextQuestion() {
    _timer?.cancel();
    if (_currentQuestionIndex == widget.questions.length) {
      _timer?.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (context) => TestResult(
            score: _score,
            timeTakenPerQuestion: _timeTakenPerQuestion,
          ),
        ),
      );
    } else {
      _currentQuestionIndex++;
      _startQuestionTimer();
    }
  }

  void _selectAnswer(String selectedAnswer) {
    String correctAnswer =
        widget.questions[_currentQuestionIndex.toString()]!['Answer'] as String;
    selectedAnswer = selectedAnswer.trim();
    correctAnswer = correctAnswer.trim();
    String ans = widget.questions[_currentQuestionIndex.toString()]!['Options']![correctAnswer] as String;
    // print(selectedAnswer+"===="+ans);
    if (selectedAnswer == ans) {
      _score++;
    }
    _timeTakenPerQuestion.add(widget.questionTimeLimit * 60 - _remainingSeconds);
    _goToNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    String currentQuestion = widget
        .questions[_currentQuestionIndex.toString()]!['Question'] as String;
    List<String> options =
        (widget.questions[_currentQuestionIndex.toString()]!['Options']
                as Map<String, dynamic>)
            .values
            .cast<String>()
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Question $_currentQuestionIndex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                currentQuestion,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Time Remaining: $_remainingSeconds seconds',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _selectAnswer(option),
                  child: Text(option),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
