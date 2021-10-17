import 'package:animated_textbox/animated_textbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animated Textbox',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff161218),
        body: Center(
          child: AnimatedTextbox(),
        ),
      ),
    );
  }
}
