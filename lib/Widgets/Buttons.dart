import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final colorbutton, //Color of button
      colortext; //color of text
  final String textbutton; // text of button
  final Tapped;
  final double size;
  MyButton(
      {this.colorbutton,
      this.colortext,
      required this.textbutton,
      this.Tapped, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Tapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: colorbutton,
            child: Center(
              child: Text(textbutton,
                  style: TextStyle(color: colortext, fontSize: size)),
            ),
          ),
        ),
      ),
    );
  }
}
