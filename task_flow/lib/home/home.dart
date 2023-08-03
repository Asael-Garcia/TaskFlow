import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        children: [
          //contenedor de bienvenida del usuarios
          const Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinea el texto a la izquierda
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 25,
                    top: 60), // Añade un padding de 5 unidades a la izquierda
                child: Text(
                  "Bienvenido de nuevo usuario",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(26, 29, 35, 1),
                    fontWeight: FontWeight.w800, // Fuente en negrita
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 25,
                    top: 10), // Añade un padding de 5 unidades a la izquierda
                child: Text("Mira tus tareas asignadas para el día de hoy"),
              ),
            ],
          ),
          //contenedor de las tareas pendientes para el día
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                height: 100,
                child: ListView(
                  shrinkWrap:
                      true, // Ajusta el tamaño del ListView al contenido
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Título",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2, // Altura de la línea
                          color: Colors.grey, // Color de la línea
                          margin: EdgeInsets.symmetric(
                              vertical: 8), // Margen entre título y descripción
                        ),
                        Text(
                          "Título",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2, // Altura de la línea
                          color: Colors.grey, // Color de la línea
                          margin: EdgeInsets.symmetric(
                              vertical: 8), // Margen entre título y descripción
                        ),
                        Text(
                          "Título",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2, // Altura de la línea
                          color: Colors.grey, // Color de la línea
                          margin: EdgeInsets.symmetric(
                              vertical: 8), // Margen entre título y descripción
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          //widgets de Agenda, proyecttos, Equipos de trabajo y mi dia
          Container(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true, // Para que tome solo el espacio necesario
              physics:NeverScrollableScrollPhysics(), // Deshabilitar el desplazamiento del ListView
              children: [
                _buildItemWidget("Agenda"),
                _buildItemWidget("Proyectos"),
                _buildItemWidget("Equipos de trabajo"),
                _buildItemWidget("Mi día"),
              ],
            ),
          ),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
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

Widget _buildItemWidget(String title) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Descripción del $title",
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}
