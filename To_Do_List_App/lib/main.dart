import 'package:flutter/material.dart';

void main()
{
  runApp(const ToDoApp());
}
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To_Do_List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoHomePage(),
    );
  }
}

class ToDoHomePage extends StatefulWidget
{
  const ToDoHomePage({super.key});

  @override
  State<ToDoHomePage> createState() => _ToDoHomePageState();
}
class _ToDoHomePageState extends State<ToDoHomePage> {
  final TextEditingController _textEditingController = TextEditingController(); //
  final List<Map<String, dynamic>> _toDoList = []; //

  // _tasks → private list (because of the _).
  //List<Map<String, dynamic>> → a list where each item is a Map with string keys and values that can be any type (dynamic).

  void _addTask() {
    if (_textEditingController.text.isNotEmpty) {
      setState(() {
        _toDoList.add({
          'task': _textEditingController.text,
          'done': false,
        });
        _textEditingController.clear();
      });
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _toDoList[index]['done'] = !_toDoList[index]['done'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          //input field adding button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: "Enter a task...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text("Add"),
                ),
              ],
            ),
          ),

          // List of tasks
          Expanded(
            child: ListView.builder(
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                final task = _toDoList[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    _deleteTask(index);
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    leading: Checkbox(
                      value: task["done"],
                      onChanged: (value) {
                        _toggleTask(index);
                      },
                    ),
                    title: Text(
                      task["task"],
                      style: TextStyle(
                        decoration: task["done"]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteTask(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ]
      ),

    );
  }
}
