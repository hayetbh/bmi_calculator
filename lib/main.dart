import 'package:bmi_calculator/screens/calclutor_page.dart';
import 'package:bmi_calculator/screens/calculator.dart';
import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/route_manager.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: '/homePage',
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xff0a0e21),
      scaffoldBackgroundColor: Color(0xff0a0e21),
    ),
    defaultTransition: Transition.zoom,
    //translations: MyTranslations(),
    //locale: Locale('fr'),
    //locale : Get.deviceLocale ,
    //fallbackLocale: Locale('fr'),
    getPages: [
      GetPage(name: '/homePage', page: () => HomePage()),
      GetPage(name: '/calculator', page: () => Calculator()),
      /*GetPage(
        name: '/thirdPage',
        page: () => ThirdPage(),
        binding: SampleBind(),
      )*/
    ],
  ));
}
