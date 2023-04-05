import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todospring/Services/database_services.dart';
import 'package:todospring/models/task.dart';
import 'package:todospring/models/tasks_data.dart';

import '../task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task>? tasks;

  getTasks() async {
    tasks = await DatabaseServices.getTasks();
    Provider.of<TasksData>(context, listen: false).tasks = tasks!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(

              title: Text(
                'Задачник                                                        у вас имеется (${Provider.of<TasksData>(context).tasks.length}) задач(а) ',
              ),
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.blue
                  ],
                )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Consumer<TasksData>(
                builder: (context, tasksData, child) {
                  return ListView.builder(
                      itemCount: tasksData.tasks.length,
                      itemBuilder: (context, index) {
                        Task task = tasksData.tasks[index];
                        return TaskTile(
                          task: task,
                          tasksData: tasksData,
                        );
                      });
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(

              backgroundColor: Colors.blue,

              child: const Icon(
                Icons.add,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const AddTaskScreen();
                    });
              },
            ),
          );
  }
}
