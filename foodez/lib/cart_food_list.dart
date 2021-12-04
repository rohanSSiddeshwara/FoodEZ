

import 'package:flutter/material.dart';
import 'package:foodez/cart.dart';

import 'food.dart';
import 'food_details_populator.dart';

final List<cart_food_details> cart_foods=[];

void add_to_cart_foods(food_details food,int quantity){
    cart_foods.add(cart_food_details(food_name: food.name, price: food.price, quantity: quantity, total_price: food.price*quantity, image_num: food.image_num));
}


class cart_populator extends StatefulWidget {
 
    @override
  _cart_populatorState createState() => _cart_populatorState();
}
class _cart_populatorState extends State<cart_populator> {
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: MediaQuery.of(context).size.height * 0.68,
                child: ListView(children:cart_foods.map((food){return cart_element(food);}).toList()));
  }
}



class cart_element extends StatefulWidget{
  cart_food_details food;
  cart_element(this.food);

  @override
  State<cart_element> createState() => _cart_elementState();
}

class _cart_elementState extends State<cart_element> {
  void _incrementCounter(){
    if(widget.food.quantity==0){
      setState(() {
     widget.food.quantity++;
     });
     cart_foods.add(widget.food);
    }
    else{
    setState(() {
      widget.food.quantity++;
    });
    }
    
}
void _decrementCounter(){
    setState(() {if(widget.food.quantity>0) {
      widget.food.quantity--;
      if(widget.food.quantity<1){ 
      cart_foods.remove(widget.food);
      }
    }}
    );
    }

   @override
  Widget build(BuildContext context) {
    int num=widget.food.image_num;
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
                      backgroundImage: AssetImage('images/Image${num}.png'),
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.food.food_name,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          Text('Rs ${(widget.food.price*widget.food.quantity)}',
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
                              
                              Text(widget.food.quantity.toString(),
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


