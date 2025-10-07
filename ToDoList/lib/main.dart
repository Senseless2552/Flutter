import 'package:flutter/material.dart';
import 'package:ToDoList/pages/home.dart';
import 'package:ToDoList/pages/main_screen.dart';

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



