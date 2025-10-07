import 'package:flutter/material.dart';
import 'package:ToDoList/Styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("My ToDo app", style: textstyle,),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Главное меню:",style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: "Times New Roman"
          )),
          Padding(padding: EdgeInsets.only(top: 15),),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/todo');
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ), 
            child: Text("Список дел",style: textstyle,)
          )
        ],
      )
        ],
      ) 
    );
  }
}