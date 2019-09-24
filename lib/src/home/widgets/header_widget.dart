import 'package:flutter/material.dart';
import 'package:nubank_interface/src/shared/util/size.dart';


class Header extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
      Container(
          margin: EdgeInsets.only(top: heightPercent('7%', context)),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Image.asset("assets/images/Nubank_Logo.png"),
                  Container(
                    margin: EdgeInsets.only(left: widthPercent('2%', context)),
                    child: 
                        Text(
                            "Igor", 
                            style: 
                              TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: heightPercent('3%', context)
                              ),
                        )
                  )
                ],
            )
      );
  }

} 