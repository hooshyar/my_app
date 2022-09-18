import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/screens/home/home_screen.dart';
import 'package:my_app/src/servers/auth_service.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({super.key});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    label: Text('Email Address'),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      label: Text('password'),
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                  onPressed: () {
                    authService
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text)
                        .then((user) => {Get.to(HomeScreen())});
                  },
                  icon: Icon(Icons.login),
                  label: Text('Login'),
                  style: TextButton.styleFrom(
                      fixedSize: Size(200, 50),
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))))
        ],
      ),
    );
  }
}
