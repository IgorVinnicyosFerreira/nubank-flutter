import 'package:flutter/material.dart';
import 'package:nubank_interface/src/home/widgets/card_widget.dart';
import 'package:nubank_interface/src/home/widgets/header_widget.dart';

class Home extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => _HomeState();

}


class _HomeState extends State<Home>{
  
  final  _cardItemsCarousel = <Widget>[
    CardMoney(),
    CardMoney()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff8B10AE),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
          <Widget>[
            Header(),
            Icon(Icons.keyboard_arrow_down, size: 25.0, color: Colors.white),
            CardMoney()
          ],
        ),
      );
  }

}