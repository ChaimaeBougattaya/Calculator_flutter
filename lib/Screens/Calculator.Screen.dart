import 'package:calculator_app/Widgets/Buttons.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  var question="question";
  var answer="answer";
  final List<String> buttons=
  [
    "C" , "DEL" , "%" , "/" ,
    "9" , "8" , "7" , "×" ,
    "6" , "5" , "4" , "-" ,
    "3" , "2" , "1" , "+" ,
    "0" , "." , "ANS" , "="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(question),
                    Text(answer)
                  ],
                ),
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext context,int index) {
                      return MyButton(
                        colorbutton: isOperator(buttons[index]) ? Colors.deepPurple :
                                    isDelete(buttons[index]) ? Colors.green :
                                    isClear(buttons[index]) ? Colors.red : Colors.deepPurple[50],
                        colortext: isOperator(buttons[index]) || isDelete(buttons[index]) || isClear(buttons[index])  ? Colors.white
                                  : Colors.deepPurple,
                        textbutton: buttons[index],
                  );
                })
               ,
              ))
        ],
      ),
    );
  }

  bool isOperator(String str){
    return ( str == "%" || str == "×" ||
              str == "-" || str == "+" ||
              str == "/" || str == "=");
  }

  bool isNumber(String str){
    return ( str == "0" || str == "1" || str == "2" ||
              str == "3" || str == "4" || str == "5" ||
              str == "6" || str == "7" || str == "8" || str == "9");
  }
  bool isDelete(String str){
    return str=="DEL";
  }
  bool isClear(String str){
    return str=="C";
  }
}
