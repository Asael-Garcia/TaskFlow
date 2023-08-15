import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(209, 209, 209, 100),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(350, 150),
                bottomRight: Radius.elliptical(350, 150),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'ruta_de_la_imagen',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Bienvenido!",
                    style: TextStyle(
                      color: Color.fromRGBO(69, 122, 252, 1),
                      fontSize: 45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Correo Electrónico',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para manejar el inicio de sesión
                     
                      Navigator.pushNamed(context, '/mainScreen');
                      
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Ajusta el valor del radio para modificar la forma del óvalo
                      ),
                    ),
                    child: const Text('Iniciar Sesión'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
