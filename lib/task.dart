// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Task extends StatefulWidget {
  final String task_name;
  final VoidCallback onDelete;
  const Task(this.task_name, this.onDelete, {super.key});
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                isDone = !isDone;
              });
            },
            icon: Icon(
              isDone ? Ionicons.checkbox : Ionicons.checkbox_outline,
              color: isDone ? Colors.green : Colors.blue,
            ),
          ),
          Text(
          
            widget.task_name,
            style: TextStyle(
              color: isDone?Colors.grey:Colors.black,
                decoration: isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
                    
          ),
          IconButton(
              onPressed: widget.onDelete,
              icon: Icon(
                Ionicons.remove_circle_outline,
                color: Colors.red[600],
              ))
        ],
      ),
    );
  }
}
