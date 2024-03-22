import 'package:flutter/material.dart';

class Screen  extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(10),
        child: Text("99999",
        style: TextStyle(
          color: Colors.black,
          fontSize: 70,
        ),),
      height: 240,

    );
  }
}
