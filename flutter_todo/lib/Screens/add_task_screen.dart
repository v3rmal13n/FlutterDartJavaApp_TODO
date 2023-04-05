import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todospring/models/tasks_data.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.lightBlueAccent,
            Colors.blue
          ],
        )
      ),
      padding: const EdgeInsets.all(20),
      //color: Colors.black,
      child: ListView(
        children: [
          const Text(
            'Добавить задачу',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          TextField(
            autofocus: true,
            cursorColor: Colors.white,
            onChanged: (val) {
              taskTitle = val;
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (taskTitle.isNotEmpty) {
                Provider.of<TasksData>(context, listen: false)
                    .addTask(taskTitle);
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Добавить',
              style:

              TextStyle(color: Colors.blue),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.white60),
          ),
        ],
      ),
    );
  }
}
