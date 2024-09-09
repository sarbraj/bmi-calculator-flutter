import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xffFFFFFF),
          scaffoldBackgroundColor: Color(0xff0A0E21),
          textTheme:
              TextTheme(bodyMedium: TextStyle(color: Color(0xFFFFFFFF)))),
      home: InputPage(),
    );
  }
}
