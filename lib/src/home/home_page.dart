import 'package:flutter/material.dart';


class Home extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => _HomeState();

}


class _HomeState extends State<Home>{
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff8B10AE),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/Nubank_Logo.png"),
              Text(
                "Igor", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0
                ),
              )
            ],
          ),
          Text("teste")
        ],
      )
    );
  }

}