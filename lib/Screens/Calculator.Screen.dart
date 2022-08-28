import 'package:calculator_app/Widgets/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var equation = "";
  var result = "";
  final List<String> buttons = [
    "C",
    "⌫",
    "%",
    "÷",
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
                const SizedBox(
                  height: 50,
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      equation,
                      style:
                          const TextStyle(fontSize: 40, color: Colors.purple),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: const TextStyle(
                          fontSize: 30, color: Colors.purpleAccent),
                    ))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return MyButton(
                        Tapped: () {
                          setState(() {
                            switch (index) {
                              case 0:
                                {
                                  equation = "";
                                  result = "";
                                }
                                break;
                              case 1:
                                {
                                  if (equation.isNotEmpty) {
                                    equation = equation.substring(
                                        0, equation.length - 1);
                                    if (equation.isEmpty ||
                                        end_with_operator(equation)) {
                                      result = "";
                                    } else {
                                      evaluate_expression();
                                    }
                                  }
                                }
                                break;
                              case 18:
                                {
                                  //ANS
                                }
                                break;
                              case 19:
                                {
                                  // =
                                  equation = result;
                                  result = "";
                                }
                                break;
                              default:
                                {
                                  switch (equation) {
                                    case "":
                                      {
                                        //first tap
                                        if (isNumber(buttons[index])) {
                                          equation += buttons[index];
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "invalid format used",
                                              backgroundColor: Colors.black87,
                                              fontSize: 16.0);
                                        }
                                      }
                                      break;
                                    default:
                                      {
                                        if (end_with_operator(equation)) {
                                          if (isOperator(buttons[index])) {
                                            Fluttertoast.showToast(
                                                msg: "invalid format used",
                                                backgroundColor: Colors.black87,
                                                fontSize: 16.0);
                                          } else {
                                            equation += buttons[index];
                                            evaluate_expression();
                                          }
                                        } else {
                                          equation += buttons[index];
                                          if (!end_with_operator(equation)) {
                                            evaluate_expression();
                                          }else {
                                            result = "";
                                          }
                                        }
                                      }
                                      break;
                                  }
                                }
                                break;
                            }
                          });
                        },
                        colorbutton: isequal(buttons[index])
                            ? Colors.purple
                            : Colors.deepPurple[50],
                        colortext: isOperator(buttons[index]) ||
                                isDelete(buttons[index]) ||
                                isANS(buttons[index])
                            ? Colors.purple
                            : isequal(buttons[index])
                                ? Colors.white
                                : isClear(buttons[index])
                                    ? Colors.pink
                                    : Colors.black,
                        textbutton: buttons[index],
                        size: isClear(buttons[index]) ||
                                isDelete(buttons[index]) ||
                                isANS(buttons[index])
                            ? 28
                            : isOperator(buttons[index]) ||
                                    isequal(buttons[index])
                                ? 34
                                : 30,
                      );
                    }),
              ))
        ],
      ),
    );
  }

  bool isOperator(String str) {
    return (str == "%" || str == "×" || str == "-" || str == "+" || str == "÷");
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
    return str == "⌫";
  }

  bool isClear(String str) {
    return str == "C";
  }

  bool end_with_operator(String str) {
    return str.endsWith("%") ||
        str.endsWith("×") ||
        str.endsWith("-") ||
        str.endsWith("+") ||
        str.endsWith("÷");
  }

  evaluate_expression() {
    if (equation.isNotEmpty) {
      Parser p = Parser();
      String question = equation.replaceAll("×", "*");
      question = question.replaceAll('÷', '/');
      Expression exp = p.parse(question);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
    } else {
      result = "";
    }
  }

  bool isequal(String str) {
    return str == "=";
  }

  bool isANS(String str) {
    return str == "ANS";
  }
}
