import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/card_icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

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

          // Run diagnostics, can't because intermitent. Service

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
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating button clicked");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressMethod;
  final IconData child;

  const RoundIconButton({required this.child, required this.onPressMethod});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      onPressed: onPressMethod,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(child),
    );
  }
}
