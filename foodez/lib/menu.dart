import 'package:flutter/material.dart';


class menu extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white30,
            child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              
            ]
          ),
        )
        
          
        ),
    ));
  }
}

class CardsFood extends StatelessWidget {
  int image_val=14;
  CardsFood(int a){this.image_val=a;}
          @override
          Widget build(BuildContext context) {
return Container(
  margin: EdgeInsets.only(top:25,left:15,right:5),width: 200,height: 321,child: Stack(
        children: <Widget>[
      Container( width: 200,height: 250,decoration: BoxDecoration(borderRadius : BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),boxShadow : [BoxShadow(color: Color.fromRGBO(57, 57, 57, 0.2),offset: Offset(0,30),blurRadius: 60)],color : Color.fromRGBO(255, 255, 255, 1),)),
      Column(children:[
      Container(padding:EdgeInsets.all(6),width: 150,height: 150,child: CircleAvatar(child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/Image$image_val.png'),
          ))),
      Container(margin: EdgeInsets.only(left:15),child:Text('Veggie tomato mix', textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1),fontFamily: 'Poppins',fontSize: 19.5,letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,fontWeight: FontWeight.normal,height: 1.5 /*PERCENT not supported*/),)),
      Container(padding: EdgeInsets.all(5.0),child:Text('Rs 1,900', textAlign: TextAlign.center, style: TextStyle(color: Color.fromRGBO(250, 74, 12, 1),fontFamily: 'Poppins',fontSize: 17,letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,fontWeight: FontWeight.normal,height: 1)),)
      ]),
        ]
      )
    );
          }
}