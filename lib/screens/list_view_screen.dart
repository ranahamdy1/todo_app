import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return  ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index){
              return TaskTile(
                  isChecked: taskData.tasks[index].isDone,
                  taskTitle: taskData.tasks[index].name,
                  checkboxChange: (newValue){
                    taskData.updateTask(taskData.tasks[index]);
                    // setState(() {
                    //   widget.tasks[index].doneChange();
                    // });
                  }, listTileDelete: () {
                    taskData.deleteTask(taskData.tasks[index]);
                  });
              },);
            });
    // return ListView(
    //   children: [
    //     TaskTile(isChecked: tasks[0].isDone, taskTitle: tasks[0].name,),
    //     TaskTile(isChecked: tasks[1].isDone, taskTitle: tasks[1].name,),
    //     TaskTile(isChecked: tasks[2].isDone, taskTitle: tasks[2].name,),
    //   ],
    // );
  }
}

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function (bool?) checkboxChange;
  final void Function() listTileDelete;

  TaskTile({required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
    required this.listTileDelete});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough: null,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),),
      trailing:
      Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxChange,
      ),
    onLongPress: listTileDelete,
    // TaskCheckBox(isChecked,
    //   (bool? newValue){
    //     setState(() {
    //       isChecked = newValue!;
    //     });
    //   }),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool? checkboxState;
  final Function (bool?) checkboxChange;
  TaskCheckBox(this.checkboxState, this.checkboxChange);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.teal[400],
      value: checkboxState,
      onChanged: (newValue){
        checkboxChange(newValue);
        // setState(() {
        //   isChecked = newValue!;
        // });
      },
    );
  }
}
