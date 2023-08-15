import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_flow/home_main.dart';
import 'package:task_flow/landing/landing.dart';
import 'package:task_flow/login/login.dart';
import 'package:task_flow/home/home.dart';
import 'package:task_flow/projects/projects.dart';
import 'package:task_flow/projects/seeProjects.dart';
import 'package:task_flow/tasks/daily_taks.dart';
import 'package:task_flow/tasks/personalTasks.dart';
import 'package:task_flow/teams/makeTeam.dart';
import 'package:task_flow/teams/teams.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const taskFlowApp());
}
class taskFlowApp extends StatelessWidget {
  const taskFlowApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const MainScreen();
          }
          return const landing();
        },
      ),
      routes: {
        '/landing':(context)=>const landing(),
        '/login':(context)=>const login(),
        '/home':(context)=>Home(context: context,),
        '/mainScreen':(context)=>const MainScreen(),
        '/dailyTask':(context)=>const DailyTask(),
        '/projects':(context)=>const Projects(),
        '/teams':(context)=>const TeamWorks(),
        '/seeProjects':(context) => const SeeProjects(),
        '/makeTeams':(context) => const MakeTeams(),
        '/personalTasks':(context) => const PersonalTasks()
        
      },
    );
  }
}