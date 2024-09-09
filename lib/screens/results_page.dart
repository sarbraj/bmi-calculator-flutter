import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/constants.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(this.bmiResult, this.resultText);

  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            child: Text(
              'Your result',
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    this.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    'Your result is low, you should eat more',
                    style: kLabelStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              onTapMethod: () {},
            ),
            flex: 5,
          ),
          BottomButton(
            onTapMethod: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            text: 'Recalculate',
          )
        ],
      ),
    );
  }
}
