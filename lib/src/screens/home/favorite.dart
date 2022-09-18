import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/src/class/favorite_food.dart';
import 'package:my_app/src/models/foods.dart';

class Favotite extends StatefulWidget {
  const Favotite({super.key});

  @override
  State<Favotite> createState() => _FavotiteState();
}

class _FavotiteState extends State<Favotite> {
  List<Food> thefavoriteFood = FavoriteItem.favoriteFood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              color: Colors.white,
              child: thefavoriteFood.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Text('no food selected'),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            itemCount: thefavoriteFood.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.all(5),
                                elevation: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 100,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 1,
                                        ),
                                        color: Colors.white,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(FavoriteItem
                                                .favoriteFood[index].image))),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${FavoriteItem.favoriteFood[index].name}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '\$${FavoriteItem.favoriteFood[index].price}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: IconButton(
                                              iconSize: 35,
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  FavoriteItem().deletet(
                                                      thefavoriteFood[index]);
                                                });
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text('clear'),
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(200, 50),
                                    primary: Colors.white,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ))))
                      ],
                    ))),
    );
  }
}
