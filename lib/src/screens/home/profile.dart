import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_app/src/models/my_app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/src/screens/home/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _user = FirebaseAuth.instance.currentUser;

  late UserOfApp theuser;

  Future _getdata() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(_user!.uid.toString())
        .get()
        .then((user) async {
      if (user.exists) {
        setState(() {
          theuser = UserOfApp.fromSnapShot(user);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getdata();
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                color: Colors.white, //Color.fromRGBO(249, 249, 249, 1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            theuser.name,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          ' phone number :${theuser.phonenumber}}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          ' email :${theuser.email}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'location( longitude: ${theuser.longitude} _latitude: ${theuser.latitude})',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      )
                    ]))));
  }
}
