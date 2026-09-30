import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dice App',
      debugShowCheckedModeBanner: false,
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceFace = 5;
  int rightDiceFace = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
            child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextButton(
                      onPressed: changeDiceFace,
                      child: Image.asset(
                          "images/dice-six-faces-$leftDiceFace.png"))),
              Expanded(
                  child: TextButton(
                      onPressed: changeDiceFace,
                      child: Image.asset(
                          "images/dice-six-faces-$rightDiceFace.png"))),
            ],
          ),
        )));
  }

  void changeDiceFace() {
    final Random rand = Random();
    setState(() {
      leftDiceFace = rand.nextInt(6) + 1; // 0-5
      rightDiceFace = rand.nextInt(6) + 1; // 0-5
    });
  }
}
