// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textcontroller = TextEditingController();
  List<String> tasks = [];
  void _deleteTask(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purple[300],
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            'Todo App',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Add task',
                          fillColor: Colors.white,
                          hintText: 'Enter Task',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: GestureDetector(
                          onTap: () {
                            String task_name = textcontroller.text;
                            setState(() {
                              tasks.add(task_name);

                              textcontroller.clear();
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.purple,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Task(tasks[index],
                           () => _deleteTask(index));
                    }))
          ],
        ),
      ),
    );
  }
}
