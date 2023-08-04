import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  List<bool> isCheckedList = [false, false, false,false];
  List<String> projectsName = ["Hola","Como","Estan","Todos"];


  void _showInputDialog() {
    String newProject = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ingrese el nuevo proyecto"),
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
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Hacer algo con el valor ingresado (newTask)
                print("Nuevo proyecto: $newProject");
                setState(() {
                   projectsName.add(newProject);
                });
               
                Navigator.pop(context); // Cerrar el dialog después de guardar
              },
              child: Text("Guardar"),
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
        title: const Text("Proyectos"),
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
              itemCount: projectsName.length * 2 - 1,
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
                    title: Text('${projectsName[actualIndex]}'),
                  );
                }
              },
            ),
          ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botó
          _showInputDialog(); // Mostrar el Dialog con el campo de entrada
          print("Presioonado");
        },
        child: Icon(Icons.add),
        tooltip: 'Añadir proyecto',
      ),
    );
  }
}


