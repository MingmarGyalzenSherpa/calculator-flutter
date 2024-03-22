import 'package:flutter/material.dart';

class Screen  extends StatelessWidget {
  final String label;
  const Screen({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(

        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(10),
        child: Text(label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 70,
          fontWeight: FontWeight.bold,
        ),
        ),
      height: 240,

    );
  }
}
