import 'package:bmi_app/GenderSelectionWidget.dart';
import 'package:bmi_app/changebuttons.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BmiCalculatorScreen> {
  bool isMale = true;
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bmi by Sidak",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            fontSize: 20,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },
                child: GenderSelectionWidget(
                  width: width,
                  isMale: isMale,
                  backgroundColor: isMale ? cardColor : backgroundColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = false;
                  });
                },
                child: GenderSelectionWidget(
                  width: width,
                  isMale: !isMale,
                  backgroundColor: !isMale ? cardColor : backgroundColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChangeButtons(
                  txt: "weight",
                  inc: weight,
                  width: width,
                  onAdd: () => addSubtractWeight(true),
                  onRemove: () => addSubtractWeight(false),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChangeButtons(
                  txt: "age",
                  inc: age,
                  width: width,
                  onAdd: () => addSubtractAge(true),
                  onRemove: () => addSubtractAge(false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addSubtractWeight(bool isAdd) {
    
     isAdd ? weight++ : weight<=0 ? weight :  weight--;
    setState(() {});
  }

  void addSubtractAge(bool isAdd) {
    
    isAdd ? age++ : age<=0 ? age : age--;
    setState(() {});
  }
}

