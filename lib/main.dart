import 'package:flutter/material.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/screens/profile.dart';
import 'package:todo_app/screens/settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App 1",
      home: Home(),
      routes: {
        '': (context) => Home(),
        '/profile': (context) => Profile(),
        '/settings': (context) => Settings()
      },
    );
  }
}