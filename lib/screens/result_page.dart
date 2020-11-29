import 'package:bmi_calculator/screens/calclutor_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const mytitlestyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
);
const mytextresultstyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);
const myresultstyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);
const mydescriptionstyle = TextStyle(
  fontSize: 22.0,
);

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.resultText, this.bmiResult, this.resultInterpretation});

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: mytitlestyle,
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
                    resultText,
                    style: mytextresultstyle,
                  ),
                  Text(
                    bmiResult,
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
