import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/utils/styles.dart';
import 'package:bmi_calculator/utils/widgets.dart';

enum Gender {
  male,
  female,
}
Gender selectedGender;

int height = 170, age = 25, weight = 60;

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalculatorView();
  }
}

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          backgroundColor: inactiveColor,
        ),
        backgroundColor: inactiveColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              //gender
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BMIContainer(
                        myoption: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        containerColor: selectedGender == Gender.male
                            ? activeColor
                            : cardColor,
                        mychild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 75,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BMIContainer(
                        myoption: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        containerColor: selectedGender == Gender.female
                            ? activeColor
                            : cardColor,
                        mychild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 75,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //height
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BMIContainer(
                        containerColor: cardColor,
                        mychild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Select Height ",
                              style: mytextstyle,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: mynumberstyle,
                                ),
                                Text(
                                  "Cm",
                                  style: mytextstyle,
                                )
                              ],
                            ),
                            SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  inactiveTrackColor: Color(0xFF8D8E98),
                                  activeTrackColor: Colors.white,
                                  thumbColor: Color(0xFFEB1555),
                                  overlayColor: Color(0x29EB1555),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 12.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 20.0),
                                ),
                                child: Slider(
                                    value: height.toDouble(),
                                    min: 100.0,
                                    max: 220.0,
                                    onChanged: (double changeHeight) {
                                      setState(() {
                                        height = changeHeight.round();
                                      });
                                    }))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Weight and age container
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: BMIContainer(
                      containerColor: cardColor,
                      mychild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: mytextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: mynumberstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressfn: () => setState(() => weight--),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressfn: () => setState(() => weight++),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMIContainer(
                      containerColor: cardColor,
                      mychild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: mytextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: mynumberstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressfn: () => setState(() => age--),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressfn: () => setState(() => age++),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),

              CalculatorButton(
                buttonFN: () {
                  CalculBMI bmi = CalculBMI(height: height, weight: weight);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ResultPage(
                        bmiResult: bmi.calculbmi(),
                        resultText: bmi.result(),
                        resultInterpretation: bmi.interpretation(),
                      ),
                    ),
                  );
                },
                buttonTitle: "CALCULATE",
              ),
            ],
          ),
        ));
  }
}
