import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("I am rich"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true
      ),
      body: const Center(
        child: Image(
          image: AssetImage('assets/images/diamond.webp')
        )
      )
    )
  ));
}

