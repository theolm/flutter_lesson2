import 'package:aula_2/Task.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRow extends StatelessWidget {
  final Task task;
  final Function callback;

  const TaskRow({Key key, @required this.task, @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.value,
        onChanged: (value) {},
      ),
      title: Text(task.task),
      trailing: IconButton(
        onPressed: () {
          delete();
        },
        icon: Icon(Icons.delete),
      ),
    );
  }

  void delete() async {
    var prefs = await SharedPreferences.getInstance();
//    List<String> tasks = prefs.getStringList('tasks');
//    tasks.remove(text);
//    prefs.setStringList('tasks', tasks);
    callback();
  }
}
