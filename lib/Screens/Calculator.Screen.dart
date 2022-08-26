import 'package:calculator_app/Widgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var question = "";
  var answer = "";
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "×",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    ".",
    "0",
    "ANS",
    "="
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
                SizedBox(height: 50,),
                Container(
                    padding  : EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(question,style: const TextStyle(fontSize: 20),)),
                Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(answer,style: const TextStyle(fontSize: 20),))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return MyButton(
                        isTapped: () {
                          setState(() {
                            if(index==0){
                              question="";
                              answer="";
                            }else if(index==1){
                              if(!question.isEmpty){
                                question=question.substring(0,question.length-1);
                              }
                            }
                            else{
                              if(question.isEmpty){
                                if(this.isNumber(buttons[index])){
                                  question+=buttons[index];
                                  //answer=buttons[index];
                                }
                                else
                                  {
                                    Fluttertoast.showToast(
                                        msg: "invalid format used",
                                        backgroundColor: Colors.black87,
                                        fontSize: 16.0
                                    );
                                  }
                              }else{
                                if(this.end_with_operator(question)){
                                  if(this.isOperator(buttons[index])) {
                                    Fluttertoast.showToast(
                                        msg: "invalid format used",
                                        backgroundColor: Colors.black87,
                                        fontSize: 16.0
                                    );
                                  } else
                                    question+=buttons[index];
                                }else{
                                  question+=buttons[index];
                                }
                              }
                            }
                          });
                        },
                        colorbutton: isOperator(buttons[index])
                            ? Colors.deepPurple
                            : isDelete(buttons[index])
                                ? Colors.green
                                : isClear(buttons[index])
                                    ? Colors.red
                                    : Colors.deepPurple[50],
                        colortext: isOperator(buttons[index]) ||
                                isDelete(buttons[index]) ||
                                isClear(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple,
                        textbutton: buttons[index],
                      );
                    }),
              ))
        ],
      ),
    );
  }

  bool isOperator(String str) {
    return (str == "%" ||
        str == "×" ||
        str == "-" ||
        str == "+" ||
        str == "/" ||
        str == "=");
  }

  bool isNumber(String str) {
    return (str == "0" ||
        str == "1" ||
        str == "2" ||
        str == "3" ||
        str == "4" ||
        str == "5" ||
        str == "6" ||
        str == "7" ||
        str == "8" ||
        str == "9");
  }

  bool isDelete(String str) {
    return str == "DEL";
  }

  bool isClear(String str) {
    return str == "C";
  }
  bool end_with_operator(String str){
    return str.endsWith("%") || str.endsWith("×") || str.endsWith("-") ||
        str.endsWith("+") ||str.endsWith("/");
  }
}
