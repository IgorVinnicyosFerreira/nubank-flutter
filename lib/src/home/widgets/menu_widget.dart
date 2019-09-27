
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank_interface/src/home/widgets/item_menu_widget.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Menu extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _renderQRCode(context),
        _renderAccountInformation(context),
        _renderMenu(context),
        _renderLogoutButton(context)
      ],
    );
  }

  Widget _renderMenu(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: heightPercent('3%', context)),
      child: Column(
        children: <Widget>[
          ItemMenu(
            icon: FontAwesomeIcons.questionCircle,
            title: "Me ajuda",
            onTap: (){},
          ),
          ItemMenu(
            icon: FontAwesomeIcons.user,
            title: "Perfil",
            subtitle: "Nome de preferência, telefone, e-mail",
            onTap: (){},
          ),
          ItemMenu(
            icon: FontAwesomeIcons.coins,
            title: "Configurar NuConta",
            onTap: (){},
          ),
          ItemMenu(
            icon: FontAwesomeIcons.mobileAlt,
            title: "Configurações do app",
            isLast: true,
            onTap: (){},
          )
        ],
      ),
    );
  }

  Widget _renderQRCode(BuildContext context){
    return QrImage(
      data: "Hi i'm a Nubank clone app",
      version: QrVersions.auto,
      size: heightPercent('15%', context),
      backgroundColor: Colors.white,
      foregroundColor: ColorPallet.purple,
      padding: EdgeInsets.all(4), 
    );
  }

  Widget _renderAccountInformation(BuildContext context){
    TextStyle boldStyle = TextStyle(fontSize: heightPercent('2%', context), fontWeight: FontWeight.bold);
    TextStyle regularStyle= TextStyle(fontSize: heightPercent('2%', context));

    return Container(
      height: heightPercent('8%', context),
      margin: EdgeInsets.only(top: heightPercent('2%', context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Banco ",
              style: regularStyle,
              children: <TextSpan>[
                TextSpan(text: "260 - Nu Pagamentos S.A", style: boldStyle)
              ]
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Agência ",
              style: regularStyle,
              children: <TextSpan>[
                TextSpan(text: "0001", style: boldStyle)
              ]
            ),
          ),
          RichText(
            text: TextSpan(
              text: "Conta ",
              style: regularStyle,
              children: <TextSpan>[
                TextSpan(text: "5746783-9", style: boldStyle)
              ]
            ),
          )
        ],
      ),
    );
  }

  Widget _renderLogoutButton(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: heightPercent('4%', context)),
      height: heightPercent('7.5%', context),
      width: widthPercent('90%', context),
      decoration: BoxDecoration(
        border: Border.all(color: ColorPallet.white.withOpacity(0.3),width: 0.9),
        borderRadius: BorderRadius.all(Radius.circular(3))
      ),
      child: InkWell(
        onTap: (){},
        highlightColor: Colors.black.withOpacity(0.2),
        splashColor: Colors.black.withOpacity(0.1),
        child: Center(
          child: Text("SAIR DA CONTA", style: TextStyle(color: ColorPallet.white,fontSize: heightPercent('2.3%', context), fontWeight: FontWeight.bold),),
        ),
      ),   
    );
  }
}