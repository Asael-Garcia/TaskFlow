import 'package:flutter/material.dart';
import 'package:task_flow/landing/landing.dart';
import 'package:task_flow/login/login.dart';
import 'package:task_flow/home/home.dart';


void main(List<String> args) {
  runApp(taskFlowApp());
}
class taskFlowApp extends StatelessWidget {
  const taskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/':(context)=>landing(),
        '/login':(context)=>login(),
        '/home':(context)=>home()
      },
    );
  }
}