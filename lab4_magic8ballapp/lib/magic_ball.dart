import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MagicBallApp());
}

class MagicBallApp extends StatelessWidget {
  const MagicBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Magic 8 Ball Game',
      home: MagicBallGamePage(),
    );
  }
}

class MagicBallGamePage extends StatefulWidget {
  const MagicBallGamePage({super.key});

  @override
  State<MagicBallGamePage> createState() => _MagicBallGamePageState();
}

class _MagicBallGamePageState extends State<MagicBallGamePage> {
  int ballNumber = 1;

  void changeBallFace() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text("Magic 8 Ball Game"),
        backgroundColor: Colors.grey[800],
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: changeBallFace,
            child: Image.asset("images/ball$ballNumber.png"),
          ),
        ),
      ),
    );
  }
}
