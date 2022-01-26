// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

import 'cart.dart';
import 'MyProfile.dart';
import 'food.dart';

import 'orders.dart';
import 'results.dart';
import 'food_details_populator.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

List<food_details> foods = [];

void request() async {
  var url = Uri.parse("http://192.168.141.21:8000/food");
  http.Response res = await http.get(url);
  var json = jsonDecode(res.body);
  for (int i = 0; i < json.length; i++) {
    foods.add(food_details(
        name: json["$i"]["Food_Name"],
        price: json["$i"]["Food_Price"],
        details: json["$i"]["Food_Description"],
        image_num: 2,
        type: json["$i"]["Food_Type"],
        canteen: json["$i"]["Canteen_Name"]));
  }
}

List<canteen_details> canteen = [
  canteen_details(name: "udupi", image_num: 5),
  canteen_details(name: "munch", image_num: 2),
  canteen_details(name: "tango", image_num: 3),
];

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    foods = [];
    request();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => orders()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(5),
          child: SafeArea(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfile()),
                            );
                          },
                          child: Icon(Icons.menu, size: 35)),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cart()),
                          );
                        },
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Delicious \nfood for you',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ],
                  )),
              Container(
                margin:
                    EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 5),
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                  color: Color.fromRGBO(239, 238, 238, 1),
                ),
                child: ListTile(
                    leading: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black54,
                )),
              ),
              Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 30),
                          blurRadius: 60)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  margin:
                      EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      food_results(food_type: "")));
                        },
                        child: Text('Food',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.black87)),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        food_results(food_type: "veg")));
                          },
                          child: Text('Veg',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.black87))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        food_results(food_type: 'non veg')));
                          },
                          child: Text('Non Veg',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.black87))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        food_results(food_type: 'sauce')));
                          },
                          child: Text('Sauce',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.black87)))
                    ],
                  )),
              Container(),
              CardsFood_populator(""),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: Text('Favourite Cafeteria :',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.black)),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 100,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: canteen
                          .map((e) => Cafeteria(
                                image_val: e.image_num,
                                name: e.name,
                              ))
                          .toList())),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Dishes(2), Dishes(3), Dishes(14), Dishes(5)])),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: Text('Favourite Dishes :',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.black)),
              ),
              CardsFood_populator("veg"),
            ]),
          ),
        ));
  }
}

class Dishes extends StatelessWidget {
  int image_val = 14;
  Dishes(int a) {
    this.image_val = a;
  }
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white38,
        backgroundImage: AssetImage('images/Image$image_val.png'),
        radius: 40);
  }
}

class CardsFood_populator extends StatefulWidget {
  String food_type = "";
  CardsFood_populator(String food_type) {
    this.food_type = food_type;
  }
  @override
  State<CardsFood_populator> createState() => _CardsFood_populatorState();
}

class _CardsFood_populatorState extends State<CardsFood_populator> {
  List<food_details> temp_food = foods;
  List<food_details> get_food(String type) {
    food_details i;
    List<food_details> t_foods = [];
    for (i in foods) {
      if (i.type == type) {
        t_foods.add(i);
      }
    }
    if (t_foods.isEmpty) {
      return foods;
    } else
      return t_foods;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: get_food(widget.food_type).map((food) {
              return CardsFood(food_det: food);
            }).toList()));
  }
}

class CardsFood extends StatelessWidget {
  food_details food_det;
  CardsFood({required this.food_det});
  @override
  Widget build(BuildContext context) {
    int image_val = food_det.image_num;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => food(food_det)),
          );
        },
        child: Container(
            margin: EdgeInsets.only(top: 25, left: 15, right: 5),
            width: 200,
            height: 321,
            child: Stack(children: <Widget>[
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
              Column(children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                        child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/Image$image_val.png'),
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
                  margin: EdgeInsets.only(left: 19),
                  padding: EdgeInsets.all(6.0),
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
            ])));
  }
}

class Cafeteria extends StatelessWidget {
  String name;
  int image_val;
  Cafeteria({required this.name, required this.image_val});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => food_results(cafe: this.name)),
          );
        },
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(13),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color.fromRGBO(232, 232, 232, 3),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/Image$image_val.png'),
              ),
              title: Text(
                this.name,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            )));
  }
}

class FavDishes extends StatelessWidget {
  int image_val = 14;
  FavDishes(int a) {
    this.image_val = a;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(239, 238, 238, 3),
        ),
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/Image$image_val.png'),
              ),
              title: Text(
                'Munch',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              subtitle: Text('ttudunurd\nuyoofnu\nttdub'),
            )));
  }
}
