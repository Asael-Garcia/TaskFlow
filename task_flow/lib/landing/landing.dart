import "package:flutter/material.dart";

class landing extends StatelessWidget {
  const landing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  home: Scaffold(
            body: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 500,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                            'Este es un Container con carrusel de images',
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                         onPressed: () {
                          Navigator.pushNamed(context, "/login");
                         },//funcion que lo va madar a otra pantalla
                          child: Text("Iniciar sesión")
                          )
                    ]),
              ],
            ))));
  }
}
