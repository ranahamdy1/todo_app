import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_task_screen.dart';
import 'list_view_screen.dart';
import 'models/task.dart';
import 'models/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                      child: AddTaskScreen((newTaskTitle){
                        // setState(() {
                        //   tasks.add(Task(name: newTaskTitle));
                        //   Navigator.of(context).pop();
                        // });
                      }))));
        },
        backgroundColor: Colors.indigo[400],
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.playlist_add_check,size: 40,color: Colors.white,),
                SizedBox(width: 20,),
                Text('ToDayDo',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),),
              ],
            ),
            Text('${Provider.of<TaskData>(context).tasks.length} Tasks',style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

