import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final colorbutton,        //Color of button
        colortext;          //color of text
  final String textbutton;  // text of button

  MyButton({ this.colorbutton, this.colortext, required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            color: colorbutton,
            child: Center(
              child: Text(
                  textbutton,
                  style: TextStyle(
                      color: colortext,
                    fontSize: 22
                  )
              ),
            ),
          ),
        ),
    );
  }
}
