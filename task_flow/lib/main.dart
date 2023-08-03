import 'package:flutter/material.dart';
import 'package:task_flow/landing/landing.dart';
import 'package:task_flow/login/login.dart';


void main(List<String> args) {
  runApp(taskFlowApp());
}
class taskFlowApp extends StatelessWidget {
  const taskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/':(context)=>landing(),
        '/login':(context)=>login()
      },
    );
  }
}