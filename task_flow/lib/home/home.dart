
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.context}); // Pasar el contexto al widget

  final BuildContext context;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    BuildContext ctx=this.context;
    return Container(
      child: Scaffold(
        body: ListView(
          children: [
            //contenedor de bienvenida del usuarios
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 60),
                  child: Text(
                    "Bienvenido de nuevo usuario",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromRGBO(26, 29, 35, 1),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
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
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 100,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Título",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                          color: Colors.grey,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        const Text(
                          "Título",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                          color: Colors.grey,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        const Text(
                          "Título",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                          color: Colors.grey,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //widgets de Agenda, proyectos, Equipos de trabajo y mi día
            Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildItemWidget("Personal", "personalTasks", widget.context), // Pasar el contexto aquí
                  _buildItemWidget("Proyectos", "projects", widget.context), // Pasar el contexto aquí
                  _buildItemWidget("Equipos de trabajo", "teams", widget.context), // Pasar el contexto aquí
                  _buildItemWidget("Mi día", "dailyTask", widget.context), // Pasar el contexto aquí
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildItemWidget(String title, String screen, BuildContext ctx2) {
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
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(ctx2, '/$screen', arguments: "1");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Descripción del $title",
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
