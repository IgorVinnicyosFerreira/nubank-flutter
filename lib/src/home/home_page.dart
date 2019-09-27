import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nubank_interface/src/home/widgets/card_credit_widget.dart';
import 'package:nubank_interface/src/home/widgets/card_widget.dart';
import 'package:nubank_interface/src/home/widgets/header_widget.dart';
import 'package:nubank_interface/src/home/widgets/menu_widget.dart';
import 'package:nubank_interface/src/home/widgets/operation_button.dart';
import 'package:nubank_interface/src/shared/color_pallet.dart';
import 'package:nubank_interface/src/shared/util/size.dart';

class Home extends StatefulWidget{
 
  @override
  State<StatefulWidget> createState() => _HomeState();

}


class _HomeState extends State<Home> {
  
  List<Widget> _itemsSlider = <Widget>[CardMoney(),CardCredit()];
  bool _showMenu = false;
  bool openApp = false;
  Curve animationCardCurve = Curves.elasticOut;
  Duration durationAnimationCard =Duration(milliseconds: 1600);
  int _currentSlide = 0;
  
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(Duration(milliseconds: 300),(){
          setState(() {
              openApp = true;
          });
      });
    });
  }
  
  
  _showModal(BuildContext context) {
    
    showBottomSheet(context: context,builder:(BuildContext context){
       return AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.black.withOpacity(0.8),
            systemNavigationBarColor: Colors.black
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: heightPercent('90%', context),
                padding: EdgeInsets.all(heightPercent('1.5%', context)),
                color: ColorPallet.white,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(CupertinoIcons.clear_thick, size: heightPercent('5%', context), color: ColorPallet.grey,),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("NuBank", 
                        style: TextStyle(
                          color: ColorPallet.purpleLight, 
                          fontSize: heightPercent('5%', context),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
      );
    }, backgroundColor: Colors.black.withOpacity(0.8));
   
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: ColorPallet.purple,
      body: Builder(
        builder: (context) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
             Positioned(
               top: heightPercent('7%', context),
               child:  AnimatedOpacity(
                  opacity: !openApp ? 0 : 1,
                  duration: Duration(milliseconds: 400),
                  child: Header(
                    onTap: (){
                      setState(() {
                        animationCardCurve = Curves.decelerate;
                        durationAnimationCard = Duration(milliseconds: 400);
                        _showMenu = !_showMenu; 
                      });
                    }, 
                    menuOpen: _showMenu,
                  ),
                ),
             ),
              Positioned(
                top: heightPercent('16%', context),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: _showMenu ? 1 : 0,
                  child: Menu(),
                ),
              ),
              AnimatedPositioned(
                top: heightPercent('80%', context),
                right: openApp ? 0 : -widthPercent('100%', context),
                curve: Curves.elasticOut,
                duration: Duration(milliseconds: 1900),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: _showMenu ? 0 : 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child:  _renderOperationList(context),
                    
                  ),
                ),
              ),
              AnimatedPositioned(
                curve: animationCardCurve,
                duration: durationAnimationCard,
                right: openApp ? 0 : -widthPercent('100%', context),
                top: _showMenu ? heightPercent('90%', context) : heightPercent('19%', context),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onVerticalDragStart: (DragStartDetails details){
                      setState(() {
                        _showMenu = !_showMenu; 
                      });
                    },
                    child:  _renderCarouselCards(),
                  ),
                )
              ),
          ],
        ),
      )
    );
  }


  Widget _renderOperationList(BuildContext context){

    List<Widget> operations = <Widget>[
        OperationButton(icon: FontAwesomeIcons.user, title: "Indicar amigos", onTap: ()=> _showModal(context),),
        OperationButton(icon: FontAwesomeIcons.dollarSign, title: "Depositar", onTap: ()=> _showModal(context) ),
        OperationButton(icon: FontAwesomeIcons.dollarSign, title: "Transferir", onTap: ()=> _showModal(context)),
        OperationButton(icon: FontAwesomeIcons.barcode, title: "Pagar", onTap: ()=> _showModal(context)),
        OperationButton(icon: FontAwesomeIcons.commentDollar, title: "Cobrar", onTap: ()=> _showModal(context)),
        OperationButton(icon: FontAwesomeIcons.lock, title: "Bloquear cartão", onTap: ()=> _showModal(context)),
        OperationButton(icon: FontAwesomeIcons.sortAmountDownAlt, title: "Organizar atalhos", onTap: ()=> _showModal(context)),
    ];

    return Container(
        margin: EdgeInsets.only(top: heightPercent('2%', context)),
        height: heightPercent('16%', context),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: operations.map(
                (operation){

                    if(operations.indexOf(operation) == 0){
                        return Container(
                            margin: EdgeInsets.only(left: widthPercent('4%', context)),
                            child: operation,
                        );
                    }

                    return operation;
                }
            ).toList(),
        ),
    );
  }
  Widget _renderCarouselCards(){
    return Column(
      children: <Widget>[
        CarouselSlider(
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
          initialPage: _currentSlide,
          height: heightPercent("55%", context),
          viewportFraction: 1.0,
          onPageChanged: (index){
            setState(() {
               _currentSlide = index; 
            });
          },
          items: _itemsSlider.toList()
        ),
        _renderDotsIndicator()
      ],
    );
  
  }

  Widget _renderDotsIndicator(){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _itemsSlider.map((item){
            int index = _itemsSlider.indexOf(item);
            return _renderDot(index);
        }).toList(),
     ); 
  }

  Widget _renderDot(index){
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
  