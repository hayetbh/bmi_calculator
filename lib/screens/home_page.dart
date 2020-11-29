import 'package:bmi_calculator/screens/calclutor_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bmi_calculator/screens/calculator_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  //final TextEditingController emailcontroller = TextEditingController();

  //GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.purple[900],
          appBar: AppBar(
            title: Text("Welcome to BMI Calculator"),
            backgroundColor: Colors.purple[900],
            centerTitle: true,
          ),
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TextField
              TextFormField(
                cursorColor: Colors.white,
                initialValue: 'Write your name',
                maxLength: 20,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.supervised_user_circle,
                  ),
                  labelText: 'Your name',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              //button add
              FloatingActionButton.extended(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                onPressed: () {
                  // Respond to button press
                  Get.to(Calculator(), arguments: "this argument");
                },
                icon: Icon(Icons.add),
                label: Text('Next'),
              )
            ],
          ))),
    );
  }
}

/* floatingActionButon: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
          box.write("email", emailcontroller.text);
          Get.to(SecondPage() , arguments: "this argument");
        },
        icon: Icon(Icons.arrow_right_outlined),
        label: Text("next".tr),
      ),*/
