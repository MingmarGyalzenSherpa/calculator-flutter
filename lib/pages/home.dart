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
                if(operators.any((element) => element==math_exp[math_exp.length-1]))
                  {
                    return;
                  }
                Expression exp = Expression(math_exp);
                var ans =  int.parse(exp.eval().toString());
                setState(() {
                  output = math_exp = ans <0 ? (ans - (ans * 2)).toString():(ans -(ans *2)).toString();
                });

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

  void changeMode(){
    setState(() {
      isLightMode = !isLightMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLightMode?Colors.white:Colors.black,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            ThemeModeToggle(callback: changeMode),
            Screen(label: math_exp,fontSize: 30,height: 100,fontColor:isLightMode? Colors.black26:Colors.grey),
            Screen(label:output, fontSize: 50, height: 100 ,fontColor:isLightMode? Colors.black:Colors.white,),
            Expanded(
              child: Container(
                // color:Colors.red,
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (context,index){
                      return CalculatorButton(label:buttons[index], callback:handleButton,backgroundColor: isLightMode?Colors.white:Colors.black,
                      foregroundColor: isLightMode?Colors.black:Colors.white,
                      );
                    }),
              )
            ),
          ],
        ),
      )
    );
  }
}
