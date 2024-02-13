

import 'package:bmi_app/GenderSelectionWidget.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BmiCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor ,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bmi by Sidak", style : TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic,
          fontSize: 20
          
          )),
        backgroundColor: backgroundColor,
      ),
      body : Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: ,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GenderSelectionWidget(width: width, isMale: true,),
            GenderSelectionWidget(width: width, isMale: false,),       
          ],
        )
      ],)
    );
  }
}

