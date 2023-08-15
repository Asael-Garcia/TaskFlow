import 'package:flutter/material.dart';

class PersonalTasks extends StatefulWidget {
  const PersonalTasks({super.key});

  @override
  State<PersonalTasks> createState() => _PersonalTasksState();
}

class _PersonalTasksState extends State<PersonalTasks> {
  List<bool> isCheckedList = [false, false, false, false];
  List<String> dailyTaskList = ["Hola", "Como", "Estan", "Todos"];

  void _onCheckboxChanged(bool newValue, int index) {
    setState(() {
      isCheckedList[index] = newValue;
      int helper = index;
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

  void _showInputDialog() {
    String newProject = "";
   
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Ingrese la nueva tarea"),
          content: TextField(
            onChanged: (value) {
              newProject = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el dialog sin guardar
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Hacer algo con el valor ingresado (newTask)
                print("Nuevo proyecto: $newProject");
                setState(() {
                  dailyTaskList.add(newProject);
                  isCheckedList.add(false);
                });

                Navigator.pop(context); // Cerrar el dialog después de guardar
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

   void _showInputDialogEdit(int index) {
    String newProject = "";
   
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Ingrese la nueva tarea"),
          content: TextField(
            onChanged: (value) {
              newProject = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el dialog sin guardar
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Hacer algo con el valor ingresado (newTask)
                print("Nuevo proyecto: $newProject");
                setState(() {
                  dailyTaskList[index]=newProject;
                });

                Navigator.pop(context); // Cerrar el dialog después de guardar
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis tareas personales"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Hoy",
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
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        print(actualIndex);//jalar el indice
                        _showInputDialogEdit(actualIndex);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón
          
          _showInputDialog(); // Mostrar el Dialog con el campo de entrada
          print("Presioonado");
        },
        tooltip: 'Añadir',
        child: const Icon(Icons.add),
      ),
    );
  }
}
