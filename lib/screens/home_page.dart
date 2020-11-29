import 'package:bmi_calculator/screens/calclutor_page.dart';
import 'package:bmi_calculator/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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

  GetStorage box = GetStorage();

  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    box.writeIfNull("name", "test name");
    print(box.read('name'));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to BMI Calculator"),
          centerTitle: true,
          backgroundColor: inactiveColor,
        ),
        backgroundColor: inactiveColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TextField
              TextFormField(
                cursorColor: Colors.black,
                initialValue: 'Write your name',
                maxLength: 25,
                textAlign: TextAlign.center,
                cursorWidth: 5.0,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              //button add
              FloatingActionButton.extended(
                backgroundColor: activeColor,
                foregroundColor: Colors.white,
                onPressed: () {
                  // Respond to button press
                  box.write("name", emailcontroller.text);
                  Get.to(Calculator(), arguments: "this argument");
                },
                icon: Icon(Icons.add),
                label: Text('Next'),
              )
            ],
          ),
        ),
      ),
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
