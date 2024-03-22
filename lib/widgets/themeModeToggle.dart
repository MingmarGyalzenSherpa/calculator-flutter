import 'package:flutter/material.dart';

class ThemeModeToggle extends StatefulWidget {
  const ThemeModeToggle({super.key});

  @override
  State<ThemeModeToggle> createState() => _ThemeModeToggleState();
}

class _ThemeModeToggleState extends State<ThemeModeToggle> {

  bool isLightMode = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isLightMode = !isLightMode;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 60,
        height:28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:isLightMode ? Colors.grey[200]:Colors.black38,
        ),
        child:Stack(
            children: [
              Positioned(
                top:1,
                left: 4,
                child: Icon(Icons.light_mode,color: Colors.orangeAccent,),
              ),
              Positioned(
                right:4,
                child: Icon(Icons.dark_mode_outlined,color:Colors.white),
              ),
              AnimatedPositioned(
                  child: Icon(Icons.circle,color:isLightMode?Colors.grey:Colors.white,size: 26,),
                  duration:Duration(milliseconds: 300),
                  top:0.5,
                left:isLightMode?29:3,
              )
            ],
        )
      ),
    );
  }
}
