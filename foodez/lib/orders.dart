import 'package:flutter/material.dart';
import 'cart.dart';
import 'food_details_populator.dart';

List<Orders> f_orders=[
  Orders(f_name: "Dosa", price: 120, quantity: 3, payment_Status: payment_status[1], order_Status: order_status[2], canteen_Name: 'Munch', image_num: 4),
  Orders(f_name: "Idly", price: 100, quantity: 2, payment_Status: payment_status[1], order_Status: order_status[2], canteen_Name: 'Udupi', image_num: 5),
  Orders(f_name: "Vada", price: 80, quantity: 1, payment_Status: payment_status[1], order_Status: order_status[2], canteen_Name: 'Tango', image_num: 14),
  Orders(f_name: "Pongal", price: 150, quantity: 1, payment_Status: payment_status[1], order_Status: order_status[2], canteen_Name: 'Munch', image_num: 17),
  Orders(f_name: "Dosa", price: 120, quantity: 3, payment_Status: payment_status[1], order_Status: order_status[2], canteen_Name: 'Udupi', image_num: 22),
  Orders(f_name: "Idly", price: 100, quantity: 2, payment_Status: payment_status[1], order_Status: order_status[2], canteen_Name: 'Tango', image_num: 20),
];

class orders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white30,
          child: ListView( children: <Widget>[
            InkWell(onTap:  () {Navigator.pop(context);},child: page_title(title: "Orders",)),
            order_populator(),
            
            ])))));
  }
  
}

class order_populator extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: MediaQuery.of(context).size.height*0.8 ,
                child: ListView(children:f_orders.map((food){return order_widget_builder(order:food);}).toList()));
  }
}

class order_widget_builder extends StatelessWidget{
  Orders order;
  
  order_widget_builder({required this.order});
  
  @override
  Widget build(BuildContext context) {
    int num=order.image_num;
    return Container(
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
                            order.f_name,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          Text('Rs ${order.price}',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: Colors.red))
                        ]),
                    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(child: Text("Quantity : ${order.quantity}",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Colors.black)),
                                    color: Colors.white, 
                                  ),
                      Container(child: Text("${order.canteen_Name}",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: Colors.black)),
                                    color: Colors.white, 
                                  ),
                      
                    ])
                  ],
                ));
  }

}