import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "Bmi Result",
          style: titleTextStyle,
        ),
      ),
      body : Column(
        children: [
          Center(child: Text('${bmi.toStringAsFixed(2)}', style: titleTextStyle.copyWith(fontSize: 40 ),))
        ],
      )
    );
  }
}