import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CardMoney extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => CardMoneyState();

}

class CardMoneyState extends State{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(top: 30.0),
      color: Colors.white,
      child: InkWell(
        onTap: (){},
        child: Container(
          height: 370,
          width: 350,
          child: Column(
            children: <Widget>[
              Padding( 
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 90.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.coins, size: 18.0, color: Colors.grey,),
                              Text("NuConta", style: TextStyle(color: Colors.grey, fontSize: 15.0))
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(CupertinoIcons.eye, size: 35.0, color: Colors.grey),
                          onPressed: (){},
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}