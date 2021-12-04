import 'package:flutter/material.dart';
import 'food.dart';
import 'food_details_populator.dart';
import 'cart.dart';
import 'main.dart';



class food_results extends StatelessWidget {
  String food_type;
  String cafe='';
  food_results({this.food_type='',this.cafe=''});
  
  List<food_details> get_foods(String food_type){
    List<food_details> temp=[];
    for(int i=0;i<foods.length;i++){
      if(food_type!='')if(foods[i].type==food_type){
        temp.add(foods[i]);
      }
      if(cafe!='')if(foods[i].canteen==cafe){
        temp.add(foods[i]);
      }
      
    }
    return temp;
  }
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
              Container(padding:EdgeInsets.only(top:20,left:30),height:60,color: Colors.grey[50],child:Row( children: [ 
                IconButton(
                        icon: Icon(Icons.arrow_back_ios,size:30,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )])),

              SizedBox(height:800,
                child: GridView.count (
                    scrollDirection: Axis.vertical,

                    crossAxisCount: 2,
                    children:get_foods(food_type).map((e) => CardsFood(e)).toList() ),),
             
            ],)
          ),
        )
        
      
        ),
    );
  }
}





class CardsFood extends StatelessWidget {
  food_details food_det;
  CardsFood(this.food_det);
  @override
  Widget build(BuildContext context) {
    int image_num=food_det.image_num;
    return  InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => food(food_det)),
        );
      
      },
      child:Container(alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20, left: 15, right: 5),
        width: 155,
        height: 301,
        child: Container(alignment:Alignment.center,
        child:Stack(children: <Widget>[
          Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(57, 57, 57, 0.2),
                      offset: Offset(0, 30),
                      blurRadius: 60)
                ],
                color: Color.fromRGBO(255, 255, 255, 1),
              )),
          Container(alignment: Alignment.center,child:   Column(
           children: [
            Container(
                padding: EdgeInsets.all(6),
                width: 80,
                height: 80,
                child: CircleAvatar(
                    child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/Image$image_num.png'),
                ))),
            Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  food_det.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 19.5,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/),
                )),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Rs ${food_det.price}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(250, 74, 12, 1),
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1)),
            )
          ]),
    ),]))))
        ;
  }
}
