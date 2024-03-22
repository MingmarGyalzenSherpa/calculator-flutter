import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color foregroundColor;
   Color? backgroundColor;
  final Function callback;

   CalculatorButton({super.key,required this.label,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.white,
    required this.callback}){
    if(label == "=")
      {
        backgroundColor = Colors.teal[400];
      }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      callback(label);
    },
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(backgroundColor),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      ),
      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
      elevation: MaterialStatePropertyAll(0),
    ),
        child: (label!="<")? Text(label,
          style: TextStyle(
            color: foregroundColor,
            fontSize: 25,
          ),
        ):
        Icon(Icons.backspace_outlined,color: foregroundColor,)
    );
  }
}
