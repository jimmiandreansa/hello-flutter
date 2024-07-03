import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_todo_screen.dart';
import 'screens/edit_todo_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/add_todo':
      return MaterialPageRoute(builder: (_) => AddTodoScreen());
    case '/edit_todo':
      // Example: Pass arguments to edit screen
      // final args = settings.arguments;
      // return MaterialPageRoute(builder: (_) => EditTodoScreen(args));
      // return MaterialPageRoute(builder: (_) => EditTodoScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}'))));
  }
}
