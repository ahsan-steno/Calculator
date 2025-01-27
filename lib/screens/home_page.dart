import 'dart:ffi';

import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class  HomePage extends StatefulWidget {


   HomePage({super.key});

 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = "";
  var answer ="";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Calculator"),),
        body: Container(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                      Text(userInput.toString(),style: TextStyle(fontSize: 30,color: Colors.white),),
                        Text(answer.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(children: [
                    Row(children: [
                      MyButton(title: "AC", onPress: () {
                        userInput = "";
                        answer = "";
                        setState(() {

                        });

                      },),
                      MyButton(title: "+/-", onPress: () {
                        userInput += "+/-";
                        setState(() {

                        });
                      },),
                      MyButton(title: "%", onPress: () {
                        userInput += "%";
                        setState(() {

                        });
                      },),
                      MyButton(title: "/",color: Colors.orange, onPress: () {
                        userInput += "/";
                        setState(() {

                        });
                      },),
                    ],
                    ),
                    Row(children: [
                      MyButton(title: "7", onPress: () {
                        userInput += "7";
                        setState(() {

                        });

                      },),
                      MyButton(title: "8", onPress: () {
                        userInput += "8";
                        setState(() {

                        });
                      },),
                      MyButton(title: "9", onPress: () {
                        userInput += "9";
                        setState(() {

                        });
                      },),
                      MyButton(title: "*",color: Colors.orange, onPress: () {
                        userInput += "*";
                        setState(() {

                        });
                      },),
                    ],
                    ),
                    Row(children: [
                      MyButton(title: "4", onPress: () {
                        userInput += "4";
                        setState(() {

                        });

                      },),
                      MyButton(title: "5", onPress: () {
                        userInput += "5";
                        setState(() {

                        });
                      },),
                      MyButton(title: "6", onPress: () {
                        userInput += "6";
                        setState(() {

                        });
                      },),
                      MyButton(title: "-",color: Colors.orange, onPress: () {
                        userInput += "-";
                        setState(() {

                        });
                      },),
                    ],
                    ),
                    Row(children: [
                      MyButton(title: "1", onPress: () {
                        userInput += "1";
                        setState(() {

                        });
                      },),
                      MyButton(title: "2", onPress: () {
                        userInput += "2";
                        setState(() {

                        });
                      },),
                      MyButton(title: "3", onPress: () {
                        userInput += "3";
                        setState(() {

                        });
                      },),
                      MyButton(title: "+",color: Colors.orange, onPress: () {
                        userInput += "+";
                        setState(() {

                        });
                      },),
                    ],
                    ),
                    Row(children: [
                      MyButton(title: "0", onPress: () {
                        userInput += "0";
                        setState(() {

                        });
                      },),
                      MyButton(title: ".", onPress: () {
                        userInput += ".";
                        setState(() {

                        });
                      },),
                      MyButton(title: "DEL", onPress: () {
                        userInput = userInput.substring(0 ,userInput.length -1);
                        setState(() {

                        });

                      },),
                      MyButton(title: "=",color: Colors.orange, onPress: () {
                        equalPress();
                        setState(() {

                        });
                      },),
                    ],
                    ),
                                ],
                              ),
                ),
      
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalPress (){
    String finalUserInput = userInput;
   finalUserInput = userInput.replaceAll("x", "*");
 Parser p =Parser();
 Expression expression = p.parse(userInput);
 ContextModel contextModel = ContextModel();

 double eval = expression.evaluate(EvaluationType.REAL, contextModel);
 answer = eval.toString();
  }
}
