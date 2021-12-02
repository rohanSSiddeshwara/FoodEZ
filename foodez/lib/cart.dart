// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class cart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white30,
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            Container(
                padding: EdgeInsets.all(30),
                height: 100,
                color: Colors.grey[50],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text("Cart",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ])),
            SizedBox(
              height: 10,
            ),
           cart_element(name: "food_ufv", Price: 100, image_number: 14),
           cart_element(name: "food", Price: 400, image_number: 14),

            Container(
              height: 72,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Color.fromRGBO(248, 74, 12, 1)),
              child: Text("Complete order",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        )),
      ),
    );
  }
}



class cart_element extends StatefulWidget{
  final String name;
  final double Price;
  
  
  final int image_number;
  cart_element({required this.name,required this.Price,required this.image_number});

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
void _decrementCounter(){if(quantity>1){
    setState(() {
      quantity--;
      
    });}
    else {quantity=1;}
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
                      backgroundImage: AssetImage('images/Image${widget.image_number}.png'),
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            this.widget.name,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          Text(((this.widget.Price)*quantity).toString(),
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


