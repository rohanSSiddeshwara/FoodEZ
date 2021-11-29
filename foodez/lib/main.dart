// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodez/menu.dart';
import 'cart.dart';
import 'MyProfile.dart';
import 'food.dart';
import 'menu.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 35),
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
                        color: Color.fromRGBO(57, 57, 57, 0.10000000149011612),
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
                    Text('Food',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.black)),
                    Text('Drinks',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.black54)),
                    Text('Snacks',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.black54)),
                    Text('Sauce',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.black54))
                  ],
                )),
            SizedBox(
                height: 300,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [CardsFood(2), CardsFood(4), CardsFood(3)])),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 238, 238, 3),
              ),
              height: 50,
              child: Text('Favourite Cafeteria :',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.black)),
            ),
            SizedBox(
                height: 100,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [Cafeteria(5), Cafeteria(17), Cafeteria(18)])),
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Dishes(2), Dishes(3), Dishes(14), Dishes(5)])),
            SizedBox(height: 30),
            SizedBox(
                height: 300,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [CardsFood(22), CardsFood(21), CardsFood(18)])),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 238, 238, 3),
              ),
              height: 50,
              child: Text('Favourite Dishes :',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.black)),
            ),
            SizedBox(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [FavDishes(19), FavDishes(5), FavDishes(3)])),
            SizedBox(height: 30),
            SizedBox(
                height: 300,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [CardsFood(2), CardsFood(3), CardsFood(5)])),
          ]),
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

class CardsFood extends StatelessWidget {
  int image_val = 14;
  CardsFood(int a) {
    this.image_val = a;
  }
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => food()),
        );
      
      },
      child:Container(
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
                padding: EdgeInsets.all(6),
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
                  'Veggie tomato mix',
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
              child: Text('Rs 1,900',
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
        ])))
        ;
  }
}

class Cafeteria extends StatelessWidget {
  int image_val = 14;
  Cafeteria(int a) {
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
            padding: EdgeInsets.all(13),
            width: 200,
            height: 200,
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
              subtitle: Text('welcome'),
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
