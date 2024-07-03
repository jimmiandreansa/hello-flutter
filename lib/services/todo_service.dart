import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/todo.dart';

class TodoService {
  static const apiUrl = 'https://jsonplaceholder.typicode.com/todos';

  static Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Iterable todosJson = jsonDecode(response.body);
      return todosJson.map((todoJson) => Todo.fromJson(todoJson)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  // Add other CRUD operations as needed
}
