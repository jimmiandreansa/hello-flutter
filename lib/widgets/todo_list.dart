import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(todo: todos[index]);
      },
    );
  }
}
