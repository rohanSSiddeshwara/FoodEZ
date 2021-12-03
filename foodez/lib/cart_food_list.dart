

import 'package:flutter/material.dart';
import 'package:foodez/cart.dart';

import 'food.dart';
import 'food_details_populator.dart';


 List<food_details> c_foods=[];

class cart_populator extends StatefulWidget {
 
    @override
  _cart_populatorState createState() => _cart_populatorState();
}
class _cart_populatorState extends State<cart_populator> {
  
  void add_food(food_details food){
    setState(() {
      c_foods.add(food);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(children:c_foods.map((food){return cart_element(food);}).toList());
  }
}


class cart_element extends StatefulWidget{
  final food_details food;
  cart_element(this.food);

  @override
  State<cart_element> createState() => _cart_elementState();
}

class _cart_elementState extends State<cart_element> {
  int quantity =1;
 late double total_price;
  void _incrementCounter(){
    setState(() {
      quantity++;
    });
  
}
void _decrementCounter(){if(quantity>0){
    setState(() {
      quantity--;
      if(quantity==0){c_foods.remove(widget.food);}
    });}
    
  }
   @override
  Widget build(BuildContext context) {
    return  Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(57, 57, 57, 0.2),
                        offset: Offset(0, 10),
                        blurRadius: 60)
                  ],
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Image${widget.food.image_num}.png'),
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            this.widget.food.name,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          Text(((this.widget.food.price)*quantity).toString(),
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: Colors.red))
                        ]),
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(248, 74, 12, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             InkWell(onTap: _decrementCounter,
                               child: Container(
                                      child: Icon(Icons.horizontal_rule_rounded ,
                                    color: Colors.white, 
                                    
                                    
                                    
                                  )),
                             ),
                              
                              Text(quantity.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      color: Colors.white)),
                              InkWell(onTap: _incrementCounter,
                                child: Container(
                                    child: Icon(Icons.add_sharp,
                                        color: Colors.white)),
                              )
                            ]),
                      )
                    ])
                  ],
                ));
    
  }


  }


