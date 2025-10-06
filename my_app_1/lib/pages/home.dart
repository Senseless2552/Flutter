import 'package:flutter/material.dart';
import 'package:my_app_1/Styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDo;
  List todolist = [];

@override
  void initState() {
    super.initState();

    todolist.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo-List", style: textstyle,),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todolist[index]),onDismissed: (direction) {
              setState(() {
                todolist.removeAt(index);
              });
            }, 
            child: Card(
              color: Colors.grey[500],
              child: ListTile(
                title: Center (
                  child: Text(todolist[index], 
                  style: textstyle)))
            )  
              
          ); 
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.grey[500],
              title: Text("Добавить задачу", style: textstyle,),
              content: TextField(
                style: textstyle,
                onChanged: (String value) {
                  _userToDo = value;
                },
              ),
              actions: [
                 TextButton(onPressed: () {           
                  Navigator.of(context).pop();
                }, 
                child: Text("Отмена", style: TextStyle(
                  color: Colors.white,
                  
                ),)
                 ),
                  ElevatedButton(onPressed: () {
                  setState(() {
                    todolist.add(_userToDo);
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Добавить", style:TextStyle(color: Colors.black))
                )
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        )
        ),
    );
  }
}