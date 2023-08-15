import 'package:flutter/material.dart';
import 'package:task_flow/home/home.dart';
import 'package:task_flow/pending/pending.dart';
import 'package:task_flow/profile/user_profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  //contenedores de las pantallas
  


  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    final screens= [ Home(context: context), const Pendings(), const UserProfile()];
      
    return MaterialApp(
      
      home: Scaffold(
        //donde se presentan los contenedores
        
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Pendientes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            
          ],
        ),
      ),
    );
  }
}
