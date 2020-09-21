import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:covid_app/screens/home_screen.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//  print(confirm);
    return MaterialApp(
      theme:
      ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xff726a95)),
      home: HomeScreen(),
    );
  }
}