import 'package:flutter/material.dart';
import 'package:my_app_1/pages/home.dart';
import 'package:my_app_1/pages/main_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.white,

  ),
  initialRoute: "/",
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home(),
  },
));



