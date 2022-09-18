import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/screens/home/cart.dart';
import 'package:my_app/src/screens/home/botton_navigation.dart';
import 'package:my_app/src/screens/home/favorite.dart';
import 'package:my_app/src/screens/home/homescreen_list_of_food.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height -
        (kBottomNavigationBarHeight + kToolbarHeight) -
        MediaQuery.of(context).viewPadding.top;

    ;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Container(
          height: hight,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          color: Colors.white, //Color.fromRGBO(249, 249, 249, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: hight * 0.15,
                width: 160,
                margin: EdgeInsets.fromLTRB(20, 10, 5, 0),
                child: Text(
                  'Delicious food for you',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(239, 238, 238, 1),
                    hintText: 'search',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  autofocus: false,
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                ),
              ),
              Container(
                  height: hight * 0.7,
                  child: FoodList(
                    hight: hight * 0.7,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
