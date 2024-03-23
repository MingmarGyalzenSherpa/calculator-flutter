import 'package:flutter/material.dart';

class Screen  extends StatelessWidget {
  final String label;
  final double height;
  final double fontSize;
  final Color fontColor;
  const Screen({super.key,required this.label,required this.height,required this.fontSize,required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(10),
        child: Text(label,
        style: TextStyle(
          color: fontColor,
          fontSize: this.fontSize,
          fontWeight: FontWeight.bold,
        ),
        ),
      height: this.height,
      // color:Colors.red,
    );
  }
}
