import 'package:flutter/material.dart';
import 'package:task_flow/home_main.dart';
import 'package:task_flow/landing/landing.dart';
import 'package:task_flow/login/login.dart';
import 'package:task_flow/home/home.dart';
import 'package:task_flow/projects/projects.dart';
import 'package:task_flow/projects/seeProjects.dart';
import 'package:task_flow/tasks/daily_taks.dart';
import 'package:task_flow/teams/makeTeam.dart';
import 'package:task_flow/teams/teams.dart';


void main(List<String> args) {
  runApp(taskFlowApp());
}
class taskFlowApp extends StatelessWidget {
  const taskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      initialRoute: '/makeTeams',
      routes: {
        '/':(context)=>landing(),
        '/login':(context)=>login(),
        '/home':(context)=>Home(),
        '/mainScreen':(context)=>MainScreen(),
        '/dailyTask':(context)=>DailyTask(),
        '/projects':(context)=>Projects(),
        '/teams':(context)=>TeamWorks(),
        '/seeProjects':(context) => SeeProjects(),
        '/makeTeams':(context) => MakeTeams()
        
      },
    );
  }
}