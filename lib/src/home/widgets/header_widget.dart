import 'package:flutter/material.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';


class Header extends StatelessWidget{
  
  Header({@required this.onTap, @required this.menuOpen});
  
  bool menuOpen;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
       InkWell(
            onTap: onTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Image.asset("assets/images/Nubank_Logo.png"),
                    Container(
                      margin: EdgeInsets.only(left: widthPercent('2%', context)),
                      child: Text(
                          "Igor", 
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: heightPercent('3%', context)
                          ),
                      )
                    )
                  ],
              ),
              Icon(
                menuOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, 
                size: heightPercent('3.5%', context), 
                color: ColorPallet.white
              ),
              
            ],
          ),
        );
            

  }

} 