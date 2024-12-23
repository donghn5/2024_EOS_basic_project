import 'package:eos_todolist/screens/home_screen.dart';
import 'package:eos_todolist/screens/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EOS ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Pretendard',
      ),
      home: HomeScreen(),
    );
  }
}