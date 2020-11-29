import 'package:bmi_calculator/screens/calculator_page.dart';
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
  //GetStorage box = GetStorage();

  // this allows us to access the TextField text
  TextEditingController namecontroller = TextEditingController();
  GetStorage box = GetStorage();

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
                controller: namecontroller,
                obscureText: false,
                cursorColor: Colors.black,
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

                  Get.to(Calculator());
                  box.write("name", namecontroller.text);
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
