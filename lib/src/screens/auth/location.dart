import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/src/common/loding.dart';
import 'package:my_app/src/models/my_app_user.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_app/src/screens/home/home_screen.dart';
import 'package:my_app/src/servers/location_servers.dart';

class LocationOfUser extends StatelessWidget {
  LocationOfUser({super.key, required this.userOfApp});

  UserOfApp userOfApp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('user')
          .doc(userOfApp.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          LodingIndicator();
        }
        UserOfApp theuserofapp =
            UserOfApp.fromSnapShot(snapshot.data as DocumentSnapshot);

        return Stack(fit: StackFit.expand, children: [
          Image.network(
            'https://images.unsplash.com/photo-1623407125356-49386c0fdf00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.color,
                color: Theme.of(context).primaryColor),
          ),
          Column(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECT LOCATION :',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          LocationServers().determinePosition().then((value) {
                            UserOfApp newuserofapp = UserOfApp(
                                name: userOfApp.name,
                                uid: userOfApp.uid,
                                phonenumber: userOfApp.phonenumber,
                                email: userOfApp.email,
                                dateTime: userOfApp.dateTime,
                                latitude: value.latitude.toString(),
                                longitude: value.longitude.toString());

                            FirebaseFirestore.instance
                                .collection('user')
                                .doc(userOfApp.uid)
                                .update(newuserofapp.toMap())
                                .then((value) {
                              Get.to(HomeScreen());
                            });
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.locationDot,
                          color: Theme.of(context).primaryColor,
                        ),
                        label: Text(
                          'your location',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontSize: 25),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            fixedSize: Size(300, 60),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )))
                  ],
                ),
              ),
            ],
          )
        ]);
      },
    ));
  }
}
