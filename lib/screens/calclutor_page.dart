import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xffEA1556);
const inactiveColor = Color(0xff111328);
Color femaleColor = activeColor;
Color maleColor = inactiveColor;
enum Gender {
  male,
  female,
}
Gender selectedGender;
const mytextstyle = TextStyle(
  fontSize: 18.0,
);
const mynumberstyle = TextStyle(
  fontSize: 36.0,
  fontWeight: FontWeight.bold,
);
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
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text("BMI Calculator"),
          backgroundColor: Colors.blueGrey[900],
        ),
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
                            : inactiveColor,
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
                            : inactiveColor,
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
                        containerColor: activeColor,
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
                                  "CM",
                                  style: mytextstyle,
                                )
                              ],
                            ),
                            SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 12.0),
                                    thumbColor: inactiveColor,
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 20.0),
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.pink[200]),
                                child: Slider(
                                    value: height.toDouble(),
                                    min: 120.0,
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

              //age+weight
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BMIContainer(
                        containerColor: activeColor,
                        mychild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Weight",
                              style: mytextstyle,
                            ),
                            Text(weight.toString(), style: mynumberstyle),
                            Row(
                              children: [
                                ButtonPlusMois(
                                  buttonIcon: FontAwesomeIcons.minus,
                                  onPressfn: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 0.0,
                                ),
                                ButtonPlusMois(
                                  buttonIcon: FontAwesomeIcons.plus,
                                  onPressfn: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BMIContainer(
                        containerColor: activeColor,
                        mychild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Age",
                              style: mytextstyle,
                            ),
                            Text(age.toString(), style: mynumberstyle),
                            Row(
                              children: [
                                ButtonPlusMois(
                                  buttonIcon: FontAwesomeIcons.minus,
                                  onPressfn: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 0.0,
                                ),
                                ButtonPlusMois(
                                  buttonIcon: FontAwesomeIcons.plus,
                                  onPressfn: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

class CalculatorButton extends StatelessWidget {
  CalculatorButton({@required this.buttonFN, @required this.buttonTitle});
  final Function buttonFN;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: buttonFN,
        child: Container(
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(fontSize: 25),
            ),
          ),
          height: 75.0,
          width: double.infinity,
          color: Colors.pink[500],
          margin: EdgeInsets.only(top: 10.0),
        ));
  }
}

//les mois et plus button
class ButtonPlusMois extends StatelessWidget {
  ButtonPlusMois({this.buttonIcon, this.onPressfn});
  final IconData buttonIcon;
  final Function onPressfn;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(buttonIcon),
      onPressed: onPressfn,
    );
  }
}

//widget de container
class BMIContainer extends StatelessWidget {
  BMIContainer({this.containerColor, this.mychild, this.myoption});
  final Color containerColor;
  final Widget mychild;
  final Function myoption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: myoption,
      child: Container(
        child: mychild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
