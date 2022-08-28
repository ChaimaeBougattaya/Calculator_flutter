import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Screens/Calculator.Screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
        ()=>{
        Navigator.of(context).pop(),
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CalculatorScreen())
        )
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: SpinKitCircle(
          size: 140,
          itemBuilder: (context,index) {
            final colors = [Colors.purple,Colors.pink,Colors.deepPurple,Colors.white,Colors.deepPurpleAccent];
            final color= colors[ index % colors.length ];
            return DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle
                )
            );
          },
        ),
      ),
    );
  }
}