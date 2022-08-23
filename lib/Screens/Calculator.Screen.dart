import 'package:flutter/material.dart';
class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator"
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}
