import 'package:flutter/material.dart';


class Header extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
      Container(
          margin: EdgeInsets.only(top: 45.0),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Image.asset("assets/images/Nubank_Logo.png"),
                  Container(
                    margin: EdgeInsets.only(left: 7.0),
                    child: 
                        Text(
                            "Igor", 
                            style: 
                              TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20.0
                              ),
                        )
                  )
                ],
            )
      );
  }

} 