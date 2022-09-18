import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/src/common/loding.dart';
import 'package:my_app/src/models/foods.dart';
import 'package:my_app/src/screens/home/detaile_Screen.dart';

class FoodList extends StatefulWidget {
  FoodList({super.key, required this.hight});
  double hight;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  Widget makebutton(String name) {
    return TextButton(
        onPressed: () {
          setState(() {
            type = name;
          });
        },
        child: Text(
          '${name}',
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
        ));
  }

  String type = 'burger';
  @override
  Widget build(BuildContext context) {
    if (type == null) {
      type = 'burger';
    }
    return Container(
      height: widget().hight * 0.8,
      child: ListView(
        children: [
          Container(
            height: widget().hight * 0.8 * 0.2,
            child: Row(children: [
              makebutton('burger'),
              makebutton('drinkies'),
              makebutton('pizza'),
            ]),
          ),
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance.collection('food').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LodingIndicator();
              } else if (snapshot.hasError) {
                print('error');
              } else if (snapshot.data == null) {
                print('Data is null');
              }
              List<Food> food =
                  snapshot.data!.docs.map((e) => Food.fromSnapShot(e)).toList();

              List<Food> filterfood =
                  food.where((element) => element.categories == type).toList();

              return Container(
                height: widget().hight * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              MediaQuery.of(context).size.width * 0.5,
                          mainAxisExtent: widget().hight * 0.8 * 0.7,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30),
                      itemCount: filterfood.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                            onTap: () {
                              Get.to(() => DetailScreen(
                                    food: filterfood[index],
                                  ));
                            },
                            child: Hero(
                              tag: '${filterfood[index].name}',
                              child: Container(
                                height: widget().hight * 0.8 * 0.6,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                          height:
                                              widget().hight * 0.8 * 0.7 * 0.4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: FittedBox(
                                              child: Image.network(
                                                '${filterfood[index].image}',
                                                height: widget().hight *
                                                    0.8 *
                                                    0.7 *
                                                    0.4,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height: widget().hight * 0.8 * 0.7 * 0.3,
                                      child: Text(
                                        '${filterfood[index].name}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: widget().hight * 0.8 * 0.7 * 0.2,
                                      child: Text(
                                        '\$${filterfood[index].price.toString()}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            wordSpacing: 1,
                                            letterSpacing: 1,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                      }),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
