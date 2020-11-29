import 'dart:math';
//import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';

class CalculBMI {
  final int height;
  final int weight;
  double _bmi;
  //final String name;

  CalculBMI({this.height, this.weight});

  String calculbmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi > 30)
      return 'Obesity';
    else if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String interpretation() {
    if (_bmi > 30)
      return 'Ohh No! You have much more weight than that of a normal person. Consult a doctor immediately!!';
    else if (_bmi > 25)
      return 'Ahh! Your body weight is more than normal. Try to exercise more and maintain a healthy diet.';
    else if (_bmi > 18.5)
      return 'WOW! You have a perfect weight. Let\'s maintain this.';
    else
      return 'Ohh! Your body weight is less than normal. Try to eat more and live a healthy life.';
  }
}
