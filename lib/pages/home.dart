import 'package:calculator/widgets/calculator_btn.dart';
import 'package:calculator/widgets/screen.dart';
import 'package:calculator/widgets/themeModeToggle.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // List buttons = ['C','+/-','%','/',
  //                 '7','8','9','x',
  //                   '4','5','6','-',
  //                 '1','2','3','+',
  //                 '.','0','<','='];


  List buttons = [
    '7','8','9','/',
    '4','5','6','-',
    '1','2','3','x',
    'C','0','+','='];

  String output = "0";
  String math_exp = "";
  void handleButton(var input){
      if(input == "=")
        {
          setState(() {
            output = "output";
            print(math_exp);
          });
          //calculate
        }else if(input == "C" || input == "+/-" || input == "%"
      || input == "/" || input == "x" || input == "-" || input == "+"
      || input == "." || input == "<")
        {
          if(input == "<")
            {
              setState(() {
                output = output.substring(0, output.length-1);
                math_exp = math_exp.substring(0,math_exp.length-1);
              });
            }else {
            setState(() {
              output = "";
            });
          }//operation
        }else{
          setState(() {
           output += input;
          });
      }
      setState(() {
        math_exp += input;
      });

  }

  bool isLightMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            ThemeModeToggle(),
            Screen(label:output),
            Expanded(
              child: Container(
                // color:Colors.red,
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
        ),
      )
    );
  }
}
