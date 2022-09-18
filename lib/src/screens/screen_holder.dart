import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:my_app/src/bottom_navigation/the_main_screen.dart';
import 'package:my_app/src/common/loding.dart';
import 'package:my_app/src/screens/auth/Regester.dart';
import 'package:my_app/src/screens/home/cart.dart';
import 'package:my_app/src/screens/home/home_screen.dart';

class ScreenHolder extends StatelessWidget {
  ScreenHolder({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges();
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LodingIndicator();
          } else if (snapshot.hasError) {
            return Text('problem');
          } else if (snapshot.data != null) {
            return BottomNavigationBarForScreens();
          }
          return RegesterScreen();
        },
      ),
    );
  }
}
