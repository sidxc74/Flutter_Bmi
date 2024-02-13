import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class ChangeButtons extends StatelessWidget {
  const ChangeButtons({
    super.key,
    required this.inc,
    required this.width, 
    required this.txt, 
    required this.onAdd, 
    required this.onRemove,

  });

  final int inc;
  final double width;
  final String txt;
  final void Function()  onAdd;
  final void Function()  onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$txt",style:titleTextStyle,),
              Text("$inc",style:titleTextStyle,),
              Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () => {
          onAdd()
        },
        child: Container(
          child: Icon(Icons.add),
          width: 25,
          height: 25,
        decoration: BoxDecoration(
                color : Colors.grey.shade800,
                borderRadius: BorderRadius.circular(15)
              ),
        ),
      ),
      GestureDetector(
        onTap:() => {
          onRemove()
        },
        child: Container(
          child: Icon(Icons.remove),
          width: 25,
          height: 25,
        decoration: BoxDecoration(
                color : Colors.grey.shade800,
                borderRadius: BorderRadius.circular(15)
              ),
        ),
      )
    ],
              )
            ],
          ),
          width : width * 0.42,
          height : width * 0.35,
          decoration: BoxDecoration(
            color : cardColor,
            borderRadius: BorderRadius.circular(10)
          ),
        );
  }
}

