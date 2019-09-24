import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';


class CardMoney extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => CardMoneyState();

}

class CardMoneyState extends State{

  bool _showMoney = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: ColorPallet.white,
      child: InkWell(
        onTap: (){},
        child: Container(
          height: heightPercent("55%", context),
          width: widthPercent("90%", context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding( 
                padding: EdgeInsets.all(heightPercent("3.5%", context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   _renderCardHeader(context),
                   _renderCardBody(context),
                  ],
                ),
              ),
              _renderFooter(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderCardHeader(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: widthPercent('25%', context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Icon(FontAwesomeIcons.coins, size: heightPercent('3%', context), color: ColorPallet.grey,),
                  Text("NuConta", style: TextStyle(color: ColorPallet.grey, fontSize: heightPercent('2.2%', context)))
              ],
            ),
          ),
          IconButton(
            icon: _showMoney 
            ? Icon(FontAwesomeIcons.eyeSlash, size: heightPercent('3%', context), color: ColorPallet.grey)
            : Icon(FontAwesomeIcons.eye, size: heightPercent('3%', context), color: ColorPallet.grey,),
            onPressed: (){
              setState(() {
                _showMoney= !_showMoney;
              });
            },
          )
        ],
    );
  }

  _renderCardBody(BuildContext context){
      return Container(
        margin: EdgeInsets.only(top: heightPercent('7%', context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Saldo disponível", style: TextStyle(color: ColorPallet.grey, fontSize: heightPercent('2.2%', context))),
            _showMoney 
            ? Container(
              margin: EdgeInsets.only(top: heightPercent('1%', context)),
              child: Text("R\$\ 309,27", style: TextStyle(color: ColorPallet.black, fontSize: heightPercent('5%', context))),
            )
            : Container(
              width: widthPercent('55%', context),
              height: heightPercent('5%', context),
              margin: EdgeInsets.only(top: heightPercent('1%', context)),
              color: ColorPallet.greyLight,
            )
          ],
        ),
      );
  }

  Widget _renderFooter(BuildContext context){
    return Container(
      height: heightPercent('12.2%', context),
      decoration: BoxDecoration(
        color: ColorPallet.greyLight,
        borderRadius:  BorderRadius.vertical(bottom: Radius.circular(heightPercent('1%', context)))
      ),
      child: Padding(
        padding: EdgeInsets.all(heightPercent('3.5%', context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.user, size: heightPercent('3.5%', context), color: ColorPallet.grey),
            Container(
              width: 223.0,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                      TextSpan(text: "Novo!  ", 
                        style: TextStyle(
                          color: ColorPallet.purple , 
                          fontWeight: FontWeight.bold,
                          fontSize: heightPercent('2.1%', context)
                        ),
                      ),
                      TextSpan(
                        text: "Encontre seus amigos que têm NuConta",
                        style: TextStyle(color: ColorPallet.black, fontSize: heightPercent('2.1%', context))
                      )
                  ]
                )
              )
            ),
            Icon(FontAwesomeIcons.chevronRight,size: heightPercent('2%', context),color: ColorPallet.grey)
          ],
        )
      ),
    );
  }
}