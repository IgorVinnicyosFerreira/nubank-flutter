import 'package:flutter/material.dart';
import 'package:nubank_interface/src/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff8B10AE),
        accentColor: Colors.white,
        fontFamily: 'Arial',
        textTheme: TextTheme(
          body1: TextStyle(fontWeight: FontWeight.w400,color: Colors.white)
        )
      ),
      home: Home(),
    );
  }
}
