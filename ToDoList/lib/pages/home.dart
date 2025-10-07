import 'package:flutter/material.dart';
import 'package:ToDoList/Styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDo;
  List<String> todolist = [];
  Set<String> completedTasks = {};

@override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = prefs.getStringList('todolist') ?? [];
    
    setState(() {
      todolist = tasks;
    });
  }

Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todolist', todolist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
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
            _saveTasks();
            }, 
            child: Card(
              color: Colors.grey[500],
              child: ListTile(
                trailing: IconButton(onPressed: () {setState(() {
                todolist.removeAt(index);
              });
                _saveTasks();
              },
                icon: Icon(Icons.done), color: Colors.white),
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
          _userToDo = '';
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
                  _saveTasks();
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