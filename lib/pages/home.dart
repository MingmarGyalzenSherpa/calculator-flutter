import 'package:calculator/widgets/calculator_btn.dart';
import 'package:calculator/widgets/screen.dart';
import 'package:calculator/widgets/themeModeToggle.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/expression.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List buttons = ['C','+/-','%','/',
                  '7','8','9','x',
                    '4','5','6','-',
                  '1','2','3','+',
                  '.','0','<','='];

  List operators = [
    '%','/','*','-','+','.'
  ];

  // List buttons = [
  //   '7','8','9','/',
  //   '4','5','6','-',
  //   '1','2','3','x',
  //   'C','0','+','<','='];

  String output = "";
  String math_exp = "";
  void handleButton(var input){
      if(input == "=")
        {
          if(math_exp.isEmpty ||
            operators.any((element) => element == math_exp[math_exp.length-1])
          ) return;
          print("math_exp inside = = $math_exp");
          Expression exp = Expression(math_exp);
          setState(() {
            output = exp.eval().toString();
            math_exp = output;
          });
          //calculate
        }else if(input == "C" || input == "+/-" || input == "%"
      || input == "/" || input == "x" || input == "-" || input == "+"
       || input == "<")
        {
          switch(input) {
            case "<":
              {
                setState(() {
                  output =output.isEmpty ? output : output.substring(0, output.length - 1);
                  math_exp =math_exp.isEmpty ? "": math_exp.substring(0, math_exp.length - 1);
                });
                print("output = $output");
                print("math_exp = $math_exp");
                break;
              }
            case "C":
              {
                setState(() {
                  output = "";
                  math_exp = "";
                });
                break;
              }
            case "+/-":
              {
                print(operators.any((element) => element == math_exp[math_exp.length-1]));
              }
            default:
              {
                setState(() {
                  output = "";
                  math_exp += input == "x"?"*":input;
                });
              }
              break;
          }
          //operation
        }else{
          setState(() {
           output += input;
           math_exp +=input;
          });
      }

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
            Screen(label: math_exp,fontSize: 30,height: 100,fontColor: Colors.black26),
            Screen(label:output, fontSize: 50, height: 100 ,fontColor: Colors.black,),
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
