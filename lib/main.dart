import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_interface/src/home/home_page.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorPallet.purple,
        accentColor: ColorPallet.white,
        fontFamily: 'Arial',
        textTheme: TextTheme(
          body1: TextStyle(fontWeight: FontWeight.w400,color: ColorPallet.white)
        )
      ),
      home: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: ColorPallet.purple,
          systemNavigationBarColor: ColorPallet.purple
        ),
        child: Home(),
      ),
    );
  }
}
