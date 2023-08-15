import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final List<String> imageList = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
  ];

  final List<String> textList = [
    'Agenda proyectos',
    'Programa tus tareas personales y recordatorios',
    'Trabaja en equipo',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 400,
                    height: 600,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                      ),
                      items: imageList.map((item) {
                        int index = imageList.indexOf(item);
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  Text(
                                    textList[index],
                                    style: TextStyle(
                                      fontSize: 30,  // Tamaño de fuente más grande
                                      fontWeight: FontWeight.bold,  
                                      // Negritas
                                    ),
                                  ),
                                  SizedBox(height: 10),  // Espacio entre texto e imagen
                                  Image.asset(
                                    item,
                                    fit: BoxFit.fitWidth,  // Ajuste de imagen
                                    height: 300,  // Altura reducida de imagen
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    }, //funcion que lo va madar a otra pantalla
                    child: const Text("Iniciar sesión"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
