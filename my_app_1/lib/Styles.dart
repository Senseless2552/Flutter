import 'package:flutter/material.dart';

final ButtonStyle elevatedbuttonstyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.blue, 
  foregroundColor: Colors.white,
  minimumSize: Size(100, 50),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final TextStyle textstyle = TextStyle(
  color: Colors.white,
  fontFamily: "Times New Roman",
  fontSize: 25,
);