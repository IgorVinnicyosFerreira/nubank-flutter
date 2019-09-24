import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank_interface/src/home/widgets/card_widget.dart';
import 'package:nubank_interface/src/home/widgets/header_widget.dart';
import 'package:nubank_interface/src/home/widgets/operation_button.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';

class Home extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => _HomeState();

}


class _HomeState extends State<Home>{
  
  final List<Widget> _itemsSlider =  <Widget>[CardMoney(),CardMoney()];
  int _currentSlide = 0;

   final List<Widget> _operations = <Widget>[
    OperationButton(icon: FontAwesomeIcons.user, title: "Indicar amigos",),
    OperationButton(icon: FontAwesomeIcons.dollarSign, title: "Depositar", ),
    OperationButton(icon: FontAwesomeIcons.dollarSign, title: "Transferir",),
    OperationButton(icon: FontAwesomeIcons.barcode, title: "Pagar",),
    OperationButton(icon: FontAwesomeIcons.commentDollar, title: "Cobrar",),
    OperationButton(icon: FontAwesomeIcons.lock, title: "Bloquear cartão",),
    OperationButton(icon: FontAwesomeIcons.sortAmountDownAlt, title: "Organizar atalhos",),
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: ColorPallet.purple,
      body: Column(
        children: 
          <Widget>[
            Header(),
            Icon(Icons.keyboard_arrow_down, size: heightPercent('3.5%', context), color: ColorPallet.white),
            Container(
              margin: EdgeInsets.only(top: heightPercent('3.5%', context)),
              child: CarouselSlider(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: false,
                  height: heightPercent("55%", context),
                  viewportFraction: 1.0,
                  onPageChanged: (index){
           
                    setState(() {
                     _currentSlide = index; 
                    });
                  },
                  items: _itemsSlider.toList()
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _dotsIndicator(context),
              ),
              Container(
                margin: EdgeInsets.only(top: heightPercent('2%', context)),
                height: heightPercent('16%', context),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _operations.map(
                    (operation){

                      if(_operations.indexOf(operation) == 0){
                        return Container(
                          margin: EdgeInsets.only(left: widthPercent('5%', context)),
                          child: operation,
                        );
                      }

                      return operation;
                    }
                  ).toList(),
                ),
              )
          ],
        ),
      );
  }

  List<Widget> _dotsIndicator(BuildContext context){
    return _itemsSlider.map((item){
      int index = _itemsSlider.indexOf(item);
      return _renderDot(index, context);
    }).toList();
  }

  Widget _renderDot(index, BuildContext context){
    return Container(
        width: widthPercent('1.3%', context),
        height: widthPercent('1.3%', context),
        margin: EdgeInsets.symmetric(vertical: widthPercent('3.5%', context), horizontal: widthPercent('0.5%', context)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentSlide == index ? ColorPallet.white : ColorPallet.white.withOpacity(0.4)
        ),
      );
  }
}
  