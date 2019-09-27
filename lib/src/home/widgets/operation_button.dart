import 'package:flutter/material.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';



class OperationButton extends StatelessWidget {

  OperationButton({this.icon, this.title, this.onTap});

  final IconData icon;
  final String title;
  Function onTap;

  @override
  Widget build(BuildContext context) {

    double paddingLateral = widthPercent('2%', context);
    double paddingVertical = heightPercent('1.3%', context);

    return Card(
      color: ColorPallet.purpleLight,
      borderOnForeground: false,
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: widthPercent('26.5%', context),
          height: heightPercent('16%', context),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingLateral),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon, size: heightPercent('3%', context), color: ColorPallet.white,),
                Container(
                  width: widthPercent('20%', context),
                  child: Text(title, style: TextStyle(fontSize: heightPercent('2.1%', context), fontWeight: FontWeight.w100),),
                )
              ],
            ),
          ) ,
        ),
      ),
    );
  }

}