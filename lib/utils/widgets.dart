import 'package:bmi_calculator/utils/styles.dart';
import 'package:flutter/material.dart';

//Calcul Button
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
          color: activeColor,
          margin: EdgeInsets.only(top: 10.0),
        ));
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

//les button + et -
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressfn;

  RoundIconButton({this.icon, this.onPressfn});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: activeColor,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      elevation: 6,
      onPressed: onPressfn,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
