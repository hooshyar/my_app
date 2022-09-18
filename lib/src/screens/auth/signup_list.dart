import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/common/loding.dart';
import 'package:my_app/src/screens/auth/location.dart';
import 'package:my_app/src/servers/auth_service.dart';
import 'package:my_app/src/servers/firestore_service.dart';

class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var phonenNumbercontroller = TextEditingController();
    @override
    void dispose() {
      emailcontroller.dispose();
      passwordcontroller.dispose();
      super.dispose();
    }

    AuthService authService = AuthService();
    FirestoreService firestoreService = FirestoreService();
    bool isLoding = false;

    return isLoding == true
        ? LodingIndicator()
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          label: const Text('Full Name'),
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: phonenNumbercontroller,
                        decoration: InputDecoration(
                          label: const Text('Phone Number'),
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          label: const Text('Email Address'),
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            label: const Text('password'),
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          setState(() {
                            isLoding = true;
                          });
                          await authService
                              .createUserWithEmailAndPassword(
                                email: emailcontroller.text.trim(),
                                password: passwordcontroller.text,
                              )
                              .then((userCredential) => setState(() async {
                                    if (userCredential != null &&
                                        userCredential.user != null) {
                                      await firestoreService
                                          .addUserWithIntialInformatinToDb(
                                            user: userCredential.user!,
                                            name: namecontroller.text,
                                            phone: phonenNumbercontroller.text,
                                          )
                                          .then((user) => {
                                                Get.to(LocationOfUser(
                                                  userOfApp: user,
                                                ))
                                              });
                                    }
                                    isLoding = false;
                                  }));
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (context) => Test()));
                        },
                        icon: Icon(Icons.person_add_alt),
                        label: Text('Sign up'),
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
