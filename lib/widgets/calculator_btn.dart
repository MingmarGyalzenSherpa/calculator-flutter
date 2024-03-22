import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color color;

  const CalculatorButton({super.key,required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child:Text(label,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),),
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.grey),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
    ),
    );
  }
}
