import 'package:flutter/material.dart';


class food extends StatelessWidget {

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
              Container(padding:EdgeInsets.all(20),height:50,color: Colors.grey[50],child:Row(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min, children: [Icon(Icons.arrow_back_ios)])),

              Container(decoration: BoxDecoration(color: Colors.white,borderRadius : BorderRadius.circular(20),boxShadow : [BoxShadow(color: Color.fromRGBO(57, 57, 57, 0.2),offset: Offset(0,10),blurRadius: 60)],),padding:EdgeInsets.all(20),margin:EdgeInsets.all(10) ,height:600,child:Column(children: [CircleAvatar(backgroundImage: AssetImage('images/Image3.png') ,backgroundColor: Colors.white,radius: 100,),SizedBox(height:20),Text("Food Name",style:TextStyle(fontFamily: 'Poppins',fontSize: 38,fontWeight: FontWeight.normal ,color: Colors.black)),SizedBox(height:10),Text("Price",style:TextStyle(fontFamily: 'Poppins',fontSize: 20,fontWeight: FontWeight.normal ,color: Colors.red)),SizedBox(height: 10),Container(alignment: Alignment.topLeft,child:Text("Discription",style:TextStyle(fontFamily: 'Poppins',fontSize: 18,fontWeight: FontWeight.normal ,color: Colors.black))),SizedBox(height:5),Container(padding:EdgeInsets.all(5),alignment: Alignment.topLeft,child:Text("asdgvweargv\ngsdva sdg\n asgdvweagrvsedfnasdgavevas\n",style:TextStyle(fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.normal ,color: Colors.black54))),SizedBox(height:10,),Container(alignment: Alignment.topLeft,child:Text("Ingredients",style:TextStyle(fontFamily: 'Poppins',fontSize: 18,fontWeight: FontWeight.normal ,color: Colors.black))),SizedBox(height:5),Container(padding:EdgeInsets.all(5),alignment: Alignment.topLeft,child:Text("asdgvweargv\ngsdva sdg\n asgdvweagrvsedfnasdgavevas\n",style:TextStyle(fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.normal ,color: Colors.black54)))])),
              Container(height: 72,margin: EdgeInsets.all(30),decoration: BoxDecoration(borderRadius : BorderRadius.circular(60),color: Color.fromRGBO(248, 74, 12,1 )),child: Text("Add to cart",style:TextStyle(fontFamily: 'Poppins',fontSize: 20,fontWeight: FontWeight.normal,color: Colors.white)),alignment: Alignment.center,)                
              
            ]
          ),
        )
        
          
        ),
    ));
  }
}

