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
                    "Normal",
                    style: mytextresultstyle,
                  ),
                  Text(
                    "18.3",
                    style: myresultstyle,
                  ),
                  Text(
                    "your bmi is normal",
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
