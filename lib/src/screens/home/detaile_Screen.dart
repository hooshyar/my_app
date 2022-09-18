import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_app/src/class/favorite_food.dart';
import 'package:my_app/src/models/foods.dart';
import 'package:my_app/src/class/order_test.dart';
import 'package:my_app/src/screens/home/cart.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.food});
  Food food;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int itemIndex = 1;
  void _increment() {
    setState(() {
      itemIndex++;
    });
  }

  void _dicrement() {
    setState(() {
      itemIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.favorite),
                tooltip: 'add to favorite',
                onPressed: () {
                  FavoriteItem().addfood(newfood: widget.food);
                },
              ),
            )
          ],
        ),
        body: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              color: Color.fromRGBO(249, 249, 249, 1),
              ///////////////////////////////////////////////
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          widget.food.image,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Container(
                    child: Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '\$ ${widget.food.price}',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.food.details,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: 'dincrement',
                        child: Icon(
                          FontAwesomeIcons.minus,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white,
                        onPressed: () {
                          if (itemIndex <= 1) {
                          } else {
                            _dicrement();
                          }
                        },
                      ),
                      Text(
                        itemIndex.toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                      FloatingActionButton(
                          heroTag: 'increment',
                          child: Icon(Icons.add, color: Colors.black87),
                          backgroundColor: Colors.white,
                          onPressed: () {
                            _increment();
                          })
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {
                            FoodInCart().addfood(
                                newfood: widget.food, count: itemIndex);
                          },
                          child: Text('add to cart'),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 50),
                              primary: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ))))
                ],
              ),
            )));
  }
}
