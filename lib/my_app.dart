import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/src/screens/auth/location.dart';
import 'package:my_app/src/screens/home/detaile_Screen.dart';
import 'package:my_app/src/screens/home/home_screen.dart';
import 'package:my_app/src/screens/screen_holder.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'final project',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        primaryColor: const Color.fromRGBO(181, 46, 41, 1),
      ),
      home: ScreenHolder(),
    );
  }
}
