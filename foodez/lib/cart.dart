// ignore_for_file: prefer_const_constructors
import 'food_details_populator.dart';
import 'package:flutter/material.dart';
import 'cart_food_list.dart';
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
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.68,
                child:cart_populator(),
            ),
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
