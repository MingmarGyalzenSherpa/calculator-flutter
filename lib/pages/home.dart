import 'package:calculator/widgets/calculator_btn.dart';
import 'package:calculator/widgets/screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var buttons = ['C','+/-','%','/',
                  '7','8','9','x',
                    '4','5','6','-',
                  '1','2','3','+',
                  '.','0','<','='];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Screen(),
          Expanded(
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              children: [
                CalculatorButton(label: '2'),
                CalculatorButton(label: '2'),
                CalculatorButton(label: '2'),
                CalculatorButton(label: '2'),
            
              ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
