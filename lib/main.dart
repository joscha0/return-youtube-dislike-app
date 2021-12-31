import 'package:returnyoutubedislikeapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final Color primaryColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: primaryColor,
          primary: primaryColor,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: primaryColor,
            primary: primaryColor,
          )),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
