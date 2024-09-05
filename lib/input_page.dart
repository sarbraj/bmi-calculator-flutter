import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/card_icon_content.dart';
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

class _InputPageState extends State<InputPage> {
  Color maleActiveCardColor = kInactiveCardColor;
  Color femaleActiveCardColor = kInactiveCardColor;
  Genders selectedGender = Genders.Male;
  int height = 165;

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelStyle,
                ),
                Row(
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 230.0,
                  activeColor: kBottomContainerColor,
                  onChanged: (value) => {
                    this.setState(() {
                      height = value.toInt();
                    })
                  },
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
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
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
