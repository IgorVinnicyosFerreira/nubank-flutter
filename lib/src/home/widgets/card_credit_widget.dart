import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank_interface/src/shared/util/size.dart';

class CardCredit extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        height: heightPercent("55%", context),
        width: widthPercent("90%", context),
      ),
    );
  }

}