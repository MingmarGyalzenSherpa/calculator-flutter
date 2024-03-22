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

  void handleButton(var number){
    print(number);
  }

  bool isLightMode = true;
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
              color:Colors.white,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context,index){
                    return CalculatorButton(label:buttons[index], callback:handleButton);
                  }),
            )
          ),
        ],
      )
    );
  }
}
