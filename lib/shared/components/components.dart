import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  String number;
  Function onPressed;
  NumberButton({required this.number,required this.onPressed });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          onPressed(number);
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFDDDCE0),
          padding: EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Text(
          number,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ));
  }
}
class OperationButton extends StatelessWidget {
  String operation;
  Color color;
  Function onPressed;
  double font;
  OperationButton({required this.operation , required this.color , required this.onPressed , this.font = 40});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          onPressed(operation);
        },
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: CircleBorder(),
            fixedSize: Size(80, 80)
        ),
        child: Text(
          operation,
          style: TextStyle(
              fontSize: font,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ));
  }
}
