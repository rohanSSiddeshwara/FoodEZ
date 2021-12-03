import 'package:flutter/material.dart';
import 'package:foodez/food_details_populator.dart';
import 'cart_food_list.dart';



class food extends StatelessWidget {
   food_details food_det ;
   cart_populator cart_pop=cart_populator();
  food(this.food_det);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Function add_to_cart=(food_details food_det){c_foods.add(food_det);};
    int num = food_det.image_num;
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
              Container(padding:EdgeInsets.only(top:20,left:30),height:60,color: Colors.grey[50],child:Row( children: [ 
                IconButton(
                        icon: Icon(Icons.arrow_back_ios,size:30,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )])),

              Container(decoration: BoxDecoration(color: Colors.white,borderRadius : BorderRadius.circular(20),boxShadow : [BoxShadow(color: Color.fromRGBO(57, 57, 57, 0.2),offset: Offset(0,10),blurRadius: 60)],),padding:EdgeInsets.all(20),margin:EdgeInsets.all(10) ,height:600,child:Column(children: [CircleAvatar(backgroundImage: AssetImage('images/Image$num.png') ,backgroundColor: Colors.white,radius: 100,),SizedBox(height:20),Text(food_det.name,style:TextStyle(fontFamily: 'Poppins',fontSize: 38,fontWeight: FontWeight.normal ,color: Colors.black)),SizedBox(height:10),Text(food_det.price.toString(),style:TextStyle(fontFamily: 'Poppins',fontSize: 20,fontWeight: FontWeight.normal ,color: Colors.red)),SizedBox(height: 10),Container(alignment: Alignment.topLeft,child:Text("Discription",style:TextStyle(fontFamily: 'Poppins',fontSize: 18,fontWeight: FontWeight.normal ,color: Colors.black))),SizedBox(height:5),Container(padding:EdgeInsets.all(5),alignment: Alignment.topLeft,child:Text(food_det.details,style:TextStyle(fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.normal ,color: Colors.black54))),SizedBox(height:10,),Container(alignment: Alignment.topLeft,child:Text("Ingredients",style:TextStyle(fontFamily: 'Poppins',fontSize: 18,fontWeight: FontWeight.normal ,color: Colors.black))),SizedBox(height:5),Container(padding:EdgeInsets.all(5),alignment: Alignment.topLeft,child:Text("asdgvweargv\ngsdva sdg\n asgdvweagrvsedfnasdgavevas\n",style:TextStyle(fontFamily: 'Poppins',fontSize: 10,fontWeight: FontWeight.normal ,color: Colors.black54)))])),
              InkWell(onTap:(){add_to_cart(this.food_det);},child: Container(height: 72,margin: EdgeInsets.all(30),decoration: BoxDecoration(borderRadius : BorderRadius.circular(60),color: Color.fromRGBO(248, 74, 12,1 )),child: Text("Add to cart",style:TextStyle(fontFamily: 'Poppins',fontSize: 20,fontWeight: FontWeight.normal,color: Colors.white)),alignment: Alignment.center,))                
              
            ]
          ),
        )
        
          
        ),
    ));
  }
}

