

import 'package:calculator/shared/components/components.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Color operationColor = Color(0xff3A3C52);
  String operation = "";
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2f314e),
        title: Text(
            "Calculator"
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xff2f314e),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          operation,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          '$result',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: OperationButton(operation: "C", color: operationColor , onPressed: reset,)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "AC", color: operationColor,font: 30 , onPressed: remove)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "%", color: operationColor , onPressed: percentage)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "/", color: operationColor , onPressed: divide)),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(child: NumberButton(number: "1", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: "2", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: "3", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "X", color: operationColor, onPressed: multiply))
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(child: NumberButton(number: "4", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: "5", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: "6", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "-", color: operationColor, onPressed: subtract))
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(child: NumberButton(number: "7", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: "8", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: "9", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "+", color: operationColor, onPressed: add))
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(flex:2,child: NumberButton(number: "0", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: NumberButton(number: ".", onPressed: DigitClicked)),
                        SizedBox(width: 15,),
                        Expanded(child: OperationButton(operation: "=", color: Colors.deepOrange, onPressed: equal))
                      ],
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
  void DigitClicked(String digit){
      setState(() {
        operation += digit;
      });
  }
  void add(String operator){
    if(operation.isNotEmpty ){
      if(!operation.endsWith("/") && !operation.endsWith("+") && !operation.endsWith("-") && !operation.endsWith("X")) {
        setState(() {
          operation += operator;
        });
      }
    }else{
      if(result!=0){
        setState(() {
          operation += result.toString();
          operation += operator;
          result = 0.0;
        });
      }
    }
  }
  void subtract(String operator){
    if(operation.isNotEmpty){
      if(!operation.endsWith("/") && !operation.endsWith("+") && !operation.endsWith("-")&& !operation.endsWith("X")) {
        setState(() {
          operation += operator;
        });
      }
    }else{
      if(result!=0){
        setState(() {
          operation += result.toString();
          operation += operator;
          result = 0.0;
        });
      }
    }
  }
  void divide(String operator){
    if(operation.isNotEmpty){
      if(!operation.endsWith("/")&& !operation.endsWith("+") && !operation.endsWith("-")&& !operation.endsWith("X")) {
        setState(() {
          operation += operator;
        });
      }
    }else{
      if(result!=0){
        setState(() {
          operation += result.toString();
          operation += operator;
          result = 0.0;
        });
      }
    }
  }
  void multiply(String operator){
    if(operation.isNotEmpty){
      if(!operation.endsWith("/")&& !operation.endsWith("+") && !operation.endsWith("-")&& !operation.endsWith("X")) {
        setState(() {
          operation += operator;
        });
      }
    }else{
      if(result!=0){
        setState(() {
          operation += result.toString();
          operation += operator;
          result = 0.0;
        });
      }
    }
  }
  void equal(_){
    double tempResult = 0;
    bool isLeft = true;
    String lhs = "";
    String rhs = "";
    String usedOperator = "";
    setState((){
      if(operation.length>3 && (operation.contains("/")||operation.contains("X")||operation.contains("-")||operation.contains("+"))){
        for(int i=0;i<operation.length;i++){
          if(operation[i]=="+" || operation[i]=="-" || operation[i]=="/" || operation[i]=="X"){
            if(rhs.isEmpty){
              print("left:false");
              isLeft = false;
              usedOperator = operation[i];
            }else if(i==operation.length-1){
              result += tempResult;
              operation = "";
            }
            else{
              tempResult = calculate(lhs, usedOperator, rhs);
              usedOperator = operation[i];
              print("temp: $tempResult");
              lhs = tempResult.toString();
              rhs = "";
            }
          }else{
            if(isLeft){
              lhs+=operation[i].toString();
              print("left -> $lhs");
            }else{
              rhs+=operation[i].toString();
              print("right -> $rhs");
              if(i==operation.length-1){
                result += calculate(lhs, usedOperator, rhs);
                print("temp: $result");
                operation = "";
              }
            }
          }

        }
      }else{
        operation = "";
      }
    });
  }
  double calculate(String lhs , String operator , String rhs){
    double left = double.parse(lhs);
    double right = double.parse(rhs);
    if(operator=="+"){
     return left+right;
    }else if(operator=="-"){
      return left-right;
    }else if(operator=="X"){
      return left*right;
    }else{
      return left/right;
    }
  }
  void reset(String _){
    setState((){
      result = 0.0;
      operation = "";
    });
  }
  void remove(String operator){

  }
  void percentage(String operator){

  }
}
