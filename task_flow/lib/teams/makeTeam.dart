import 'package:flutter/material.dart';

class MakeTeams extends StatefulWidget {
  const MakeTeams({super.key});

  @override
  State<MakeTeams> createState() => _MakeTeamsState();
}

class _MakeTeamsState extends State<MakeTeams> {



  String projectName = "";
  String teamDescription = "";
  List<bool> isCheckedList = [false];
  List<String> members = ["Juanito"];
  List<String> rols = [
    "Project Manager",
    "Programador",
    "Editor",
    "DevOps",
    "Tester"
  ];
  List<String> rol = ["Project Manager"];
  String selectedOption = 'Opción 1';
  String respon = "Project Manager";

  void _showInputDialog() {
    String name = "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Añadir nuevo elemento"),
          content: TextField(
            onChanged: (value) {
              name = value;
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
                // Agregar el nuevo elemento a la lista

                Navigator.pop(context);
                 _showSelectDialog(name);
              },
              child: const Text("Siguiente"),
            ),
          ],
        );
      },
    );
  }

   void _showSelectDialog(String name) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Seleccionar un rol del equipo"),
          content: DropdownButton<String>(
            value: respon,
            onChanged: (String? newValue) {
              setState(() {
                respon = newValue!;
                print(newValue);
                print(respon);
              });
            },
            items: rols.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el dialog
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                // Realizar una acción con la opción seleccionada
                Navigator.pop(context); // Cerrar el dialog
                setState(() {
                   members.add(name);
                    rol.add(respon);
                });
              },
              child: const Text("Aceptar"),
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
        title: const Text("Editar equipo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Nombre del equipos:",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  teamDescription = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Ingrese la descripción del equipo",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
            child: Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: members.length * 2 - 1,
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
                  
                    title: Text(
                        '${members[actualIndex]} \nRol: ${rol[actualIndex]}'),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showInputDialog(); // Mostrar el Dialog con el campo de entrada
        },
        tooltip: 'Añadir elemento',
        child: const Icon(Icons.add),
      ),


    );
  }
}