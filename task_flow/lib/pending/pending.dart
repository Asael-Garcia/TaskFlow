import 'package:flutter/material.dart';

class Pendings extends StatefulWidget {
  const Pendings({super.key});

  @override
  State<Pendings> createState() => _PendingsState();
}

class _PendingsState extends State<Pendings> {
  List<bool> isCheckedList = [false, false, false,false];
  List<String> dailyTaskList = ["Hola","Como","Estan","Todos"];

  void _onCheckboxChanged(bool newValue, int index) {
    setState(() {
      isCheckedList[index] = newValue;
      int helper=index;
      print("Index a eliminar ${dailyTaskList[helper]}");
      if (newValue) {
        // Delay removal of the item by 2 seconds
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isCheckedList.removeAt(index);
            dailyTaskList.removeAt(index);
            print(dailyTaskList);
          });
        });
      }
    });
  }

  

  


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Mis pendeintes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Pendientes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: isCheckedList.length * 2 - 1,
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  // Calculate the actual index of the isCheckedList
                  return const Divider(
                    indent: 20,
                    endIndent: 20,
                  );
                } else {  
                  // Calculate the actual index of the isCheckedList
                  final actualIndex = index ~/ 2;
                  print(actualIndex);
                  return ListTile(
                    leading: Checkbox(
                      value: isCheckedList[actualIndex],
                      onChanged: (bool? value) {
                        _onCheckboxChanged(value!, actualIndex);
                      },
                    ),
                    title: Text(dailyTaskList[actualIndex]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
