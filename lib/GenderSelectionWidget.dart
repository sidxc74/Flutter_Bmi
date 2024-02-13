import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderSelectionWidget extends StatelessWidget {
  const GenderSelectionWidget({
    super.key,
    required this.width,
  });

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FaIcon(FontAwesomeIcons.mars, color : Colors.white, size : 60),
          Text("Male",style: TextStyle(
            color : Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          
          ),),
        ],
      ),
      width : width * 0.47,
      height : width * 0.47,
      decoration: BoxDecoration(
        color : cardColor,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}