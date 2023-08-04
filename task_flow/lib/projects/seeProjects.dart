import 'package:flutter/material.dart';

class SeeProjects extends StatefulWidget {
  const SeeProjects({super.key});

  @override
  State<SeeProjects> createState() => _SeeProjectsState();
}

class _SeeProjectsState extends State<SeeProjects> {
  String projectName = "";
  String projectDescription = "";
  List<bool> isCheckedList = [false];
  List<String> projectItems = ["Una tareas"];
  List<String> responsibles=["Juan","Pedro","Pablo","Alberto","Jose Julian"]; 
  List<String> responsibles2=["Juan"];
  String selectedOption = 'Opción 1';
  String respon= "Juan";
  List<String> options = ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'];


  void _onCheckboxChanged(bool newValue, int index) {
    setState(() {
      isCheckedList[index] = newValue;

      if (newValue) {
        // Delay removal of the item by 2 seconds
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isCheckedList.removeAt(index);
            projectItems.removeAt(index);
          });
        });
      }
    });
  }

  void _showInputDialog() {
    String newTask = "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Añadir nuevo elemento"),
          content: TextField(
            onChanged: (value) {
              newTask = value;
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
                // Agregar el nuevo elemento a la lista
              
                Navigator.pop(context);
                _showSelectDialog(newTask); // Cerrar el dialog después de guardar
              },
              child: Text("Siguiente"),
            ),
          ],
        );
      },
    );
  }


void _showSelectDialog(String newTask) {

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Seleccionar un miembro del equipo"),
          content: DropdownButton<String>(
            value: respon,
            onChanged: (String? newValue) {
              setState(() {
                 respon = newValue!;
                 print(newValue);
                 print(respon);
              });
            },
            items: responsibles.map((String option) {
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
                  projectItems.add(newTask);
                  isCheckedList.add(false);
                  responsibles2.add(respon);
                  
                });
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Nombre del proyecto:",
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
                  projectDescription = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Ingrese la descripción del proyecto",
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Selecciona el equipo de trabajo:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Container(
              width: double.infinity, // Ocupa todo el ancho disponible
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                isExpanded:
                    true, // Para que el DropdownButton abarque todo el ancho del Container
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: projectItems.length * 2 - 1,
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
                    title: Text('${projectItems[actualIndex]} \nResponsable: ${responsibles[actualIndex]}'),
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
        child: Icon(Icons.add),
        tooltip: 'Añadir elemento',
      ),
    );
  }
}
