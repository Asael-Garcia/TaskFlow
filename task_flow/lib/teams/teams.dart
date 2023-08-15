import 'package:flutter/material.dart';
class TeamWorks extends StatefulWidget {
  const TeamWorks({super.key});

  @override
  State<TeamWorks> createState() => _TeamWorksState();
}

class _TeamWorksState extends State<TeamWorks> {


  List<String> projectsName = ["Hola","Como","Estan","Todos"];


  void _showInputDialog() {
    String newProject = "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Ingrese el nuevo nombre del equipo"),
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
                   projectsName.add(newProject);
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
        title: const Text("Equipos"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Equipos de trabajo",
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
                    title: Text(projectsName[actualIndex]),
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
        tooltip: 'Añadir proyecto',
        child: const Icon(Icons.add),
      ),
    );
  }
}