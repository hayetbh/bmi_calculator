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
