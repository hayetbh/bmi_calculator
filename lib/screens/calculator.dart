import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalculatorPageView();
  }
}

class CalculatorPageView extends StatefulWidget {
  @override
  _CalculatorPageViewState createState() => _CalculatorPageViewState();
}

class _CalculatorPageViewState extends State<CalculatorPageView> {
  int currentindex = 0;
  double _sliderDiscreteValue = 20;
  int height = 180, weight = 70, age = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("BMI Calculator"),
              backgroundColor: Colors.purple[900],
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //part1
                    children: [
                      Row(
                        children: [
                          radioButton("man", Colors.purple[800], 0),
                          radioButton("women", Colors.purple[800], 1),
                        ],
                      ),
                      //part2
                      SizedBox(
                        height: 30.0,
                      ),

                      Text(
                        "Height",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xff8d8e98),
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x29eb1555)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                      //part3
                      SizedBox(
                        height: 30.0,
                      ),

                      Row(
                        children: [
                          radioButton("weight", Colors.purple[800], 0),
                          radioButton("Age", Colors.purple[800], 1),
                        ],
                      ),
                      //button calcul
                      FloatingActionButton.extended(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        onPressed: () {
                          // Respond to button press
                        },
                        icon: Icon(Icons.add),
                        label: Text('Calculate'),
                      )
                    ],
                  )),
            )));
  }

/*BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBMI calc =
                  CalculatorBMI(height: height, weight: weight);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => ResultsPage(
                          bmiResult: calc.getBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
          ), */
  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: FlatButton(
          color: currentindex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
/*crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[],
                  ),
                ),
              ],*/
