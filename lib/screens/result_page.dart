import 'package:bmi_calculator/screens/calculator_page.dart';
import 'package:bmi_calculator/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.resultText, this.bmiResult, this.resultInterpretation});

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    box.read("name").toString(),
                    style: mytitlestyle,
                  ),
                  Text(
                    " your Result is:",
                    style: mytitlestyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BMIContainer(
              containerColor: inactiveColor,
              mychild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: mytextresultstyle,
                  ),
                  Text(
                    bmiResult,
                    textAlign: TextAlign.center,
                    style: myresultstyle,
                  ),
                  Text(
                    resultInterpretation,
                    style: mydescriptionstyle,
                  )
                ],
              ),
            ),
          ),
          CalculatorButton(
            buttonFN: () {
              Navigator.pop(context);
            },
            buttonTitle: "RE-CALCULATE",
          ),
        ],
      ),
    );
  }
}
