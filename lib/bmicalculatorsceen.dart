import 'package:bmi_app/GenderSelectionWidget.dart';
import 'package:bmi_app/bmiscreen.dart';
import 'package:bmi_app/changebuttons.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BmiCalculatorScreen> {
  bool isMale = true;
  int weight = 0;
  int age = 0;
  double height = 130;

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
            fontSize: 30,
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
                  isMale: true,
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
                  isMale: false,
                  backgroundColor: !isMale ? cardColor : backgroundColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.94,
              height: width * 0.4,
              decoration: BoxDecoration(
                  color: cardColor, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Height", style: titleTextStyle),
                  Text(
                    "${height.toInt()}",
                    style: titleTextStyle.copyWith(
                        fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTickMarkColor: Colors.grey,
                        thumbColor: Colors.pink,
                        overlayColor: Colors.pink.withOpacity(0.4)),
                    child: Slider(
                        min: 100,
                        max: 240,
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }),
                  ),
                ],
              ),
            ),
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
                padding: const EdgeInsets.all(10.0),
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
          const Spacer(),
          GestureDetector(
            onTap: () {
              final bmi = weight / ((height / 100) * (height / 100));
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BmiResultScreen(bmi: bmi),
                ),
              );

              setState(() {});
            },
            child: Container(
              width: width,
              height: 50,
              color: Colors.pink,
              child: Center(
                child: Text("Calculate Your Bmi", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addSubtractWeight(bool isAdd) {
    isAdd ? weight++ : weight <= 0 ? weight : weight--;
    setState(() {});
  }

  void addSubtractAge(bool isAdd) {
    isAdd ? age++ : age <= 0 ? age : age--;
    setState(() {});
  }
}
