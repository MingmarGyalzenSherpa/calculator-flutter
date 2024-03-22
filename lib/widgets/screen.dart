import 'package:flutter/material.dart';

class Screen  extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(10),
        child: Text("this is screen",
        style: TextStyle(
          color: Colors.black,
          fontSize: 50,
        ),),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}
