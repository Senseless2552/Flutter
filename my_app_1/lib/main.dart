import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue
        ),
        scaffoldBackgroundColor: Colors.blue[50]
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Выбери гей ли Слава", style: textstyle),
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Слава Гей", style: textstyle), 
                  style: elevatedbuttonstyle
                )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Слава не Гей", style: textstyle), 
                  style: elevatedbuttonstyle
                )
                ],
              )
            ]
          )
        )
      );
  } 
}

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