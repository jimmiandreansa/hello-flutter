import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (bool? value) {
          // Implement update logic here
        },
      ),
      onTap: () {
        // Implement navigation to edit screen here
        Navigator.pushNamed(context, '/edit_todo', arguments: todo);
      },
    );
  }
}
