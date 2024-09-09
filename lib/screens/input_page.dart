import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/card_icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Genders {
  Male,
  Female,
}

enum IncDec { Increase, Decrease }

class _InputPageState extends State<InputPage> {
  Color maleActiveCardColor = kInactiveCardColor;
  Color femaleActiveCardColor = kInactiveCardColor;
  Genders selectedGender = Genders.Male;
  int height = 164;
  int weight = 59;
  int age = 25;

  void setWeightHandler(IncDec input) {
    if (input == IncDec.Decrease && weight == 0) {
      return;
    }
    this.setState(() {
      if (input == IncDec.Increase) {
        weight += 1;
      } else {
        weight -= 1;
      }
    });
  }

  void setAgeHandler(IncDec input) {
    if (input == IncDec.Decrease && age == 0) {
      return;
    }
    this.setState(() {
      if (input == IncDec.Increase) {
        age += 1;
      } else {
        age -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onTapMethod: () => {
                            setState(() {
                              selectedGender = Genders.Male;
                            }),
                          },
                      colour: selectedGender == Genders.Male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardIconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onTapMethod: () => {
                            setState(() {
                              selectedGender = Genders.Female;
                            }),
                          },
                      colour: selectedGender == Genders.Female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardIconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )),
                )
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kInactiveCardColor,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xffeb1555),
                      activeTrackColor: Colors.white70),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 230.0,
                    activeColor: kBottomContainerColor,
                    onChanged: (value) => {
                      this.setState(() {
                        height = value.toInt();
                      })
                    },
                  ),
                )
              ],
            ),
            onTapMethod: () {},
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressMethod: () =>
                                      {setWeightHandler(IncDec.Increase)},
                                  child: FontAwesomeIcons.plus,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  onPressMethod: () =>
                                      {setWeightHandler(IncDec.Decrease)},
                                  child: FontAwesomeIcons.minus,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    onTapMethod: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressMethod: () =>
                                  {setAgeHandler(IncDec.Increase)},
                              child: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onPressMethod: () =>
                                  {setAgeHandler(IncDec.Decrease)},
                              child: FontAwesomeIcons.minus,
                            )
                          ],
                        )
                      ],
                    ),
                    onTapMethod: () {},
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTapMethod: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              // Navigator.pushNamed(context, '/results');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResultsPage(calc.calculateBMI(), calc.getResults())));
            },
            text: 'Calculate',
          )
        ],
      ),
    );
  }
}
