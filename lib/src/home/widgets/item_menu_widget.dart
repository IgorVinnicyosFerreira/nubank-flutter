
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';

class ItemMenu extends StatelessWidget{
  
  ItemMenu({
    @required this.icon,
    @required this.title,
    @required this.onTap,
    this.subtitle,
    this.isLast = false
  });

  bool isLast;
  Function onTap;
  IconData icon;
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget subtitleWidget = subtitle != null 
    ? Text(
        subtitle, 
        style: TextStyle(fontSize: heightPercent("1.5%", context), color: ColorPallet.white.withOpacity(0.4)),
      )
    : Container();

    return Container(
      width: widthPercent('90%', context),
      height: heightPercent('7.5%', context),
      padding: EdgeInsets.all(heightPercent('1%', context)),
      decoration: BoxDecoration(
         border: Border(
           top: BorderSide(
             color: ColorPallet.white.withOpacity(0.2)
           ),
           bottom: isLast ? BorderSide(
             color: ColorPallet.white.withOpacity(0.2)
           ): BorderSide.none
         )
      ),
      child: InkWell(
        highlightColor: Colors.black.withOpacity(0.1),
        splashColor: Colors.black.withOpacity(0.1),
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(icon,color: ColorPallet.white, size: heightPercent('3%', context) ),
            Container(
              width: widthPercent('65%', context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ 
                  Text(title, style: TextStyle(fontSize: heightPercent("2.5%", context)),),
                  subtitleWidget
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_right, color: ColorPallet.white,size: heightPercent("3%", context),)
          ],
        ),
      ),
    );
  }
  
}