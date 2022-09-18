import 'package:flutter/material.dart';
import 'package:my_app/src/models/food_order.dart';
import 'package:my_app/src/models/foods.dart';
import 'package:my_app/src/class/order_test.dart';

class Cart extends StatefulWidget {
  Cart({Key? key, this.thefood, this.count}) : super(key: key);
  Food? thefood;
  int? count;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<FoodOrder>? food_list_order = FoodInCart.food_list_order;

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
            child: food_list_order!.isEmpty
                ? Expanded(
                    flex: 1,
                    child: Center(
                      child: Text('no food selected'),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          itemCount: food_list_order!.length,
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
                                          child: Image.network(
                                              food_list_order![index]
                                                  .food
                                                  .image))),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          food_list_order![index].food.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '\$${food_list_order![index].food.price}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'x ${food_list_order![index].count}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: IconButton(
                                            iconSize: 35,
                                            color: Colors.red,
                                            onPressed: () {
                                              setState(() {
                                                if (food_list_order!.length !=
                                                    0) {
                                                  FoodInCart().deletet(
                                                    food_list_order![index]
                                                        .food
                                                        .name,
                                                    food_list_order![index]
                                                        .food
                                                        .price,
                                                    food_list_order![index]
                                                        .count,
                                                  );
                                                } else {
                                                  FoodInCart().clear();
                                                }
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
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'total price :\$ ${FoodInCart.total}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('compelet order'),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(200, 50),
                                  primary: Colors.white,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ))))
                    ],
                  )),
      ),
    );
  }
}
