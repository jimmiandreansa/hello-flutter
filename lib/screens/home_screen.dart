import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_list.dart';
import '../services/todo_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Todo>> _todosFuture;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() {
    _todosFuture = TodoService.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: _todosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No todos found.'));
          } else {
            return TodoList(todos: snapshot.data!);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_todo');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
