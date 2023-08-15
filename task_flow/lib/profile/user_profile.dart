
import 'package:flutter/material.dart';
import 'package:task_flow/helpers/auth.helper.dart';

class UserProfile extends StatelessWidget {
  final BuildContext context;
  const UserProfile({super.key, required this.context});
  handleLogout () async {
    await AuthHandler().logout();
    Navigator.pushNamed(this.context, '/login');

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Text(
                "Cuenta",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Image.asset(
                'ruta_de_la_imagen',
                height: 400,
                width: double.infinity,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Favorito",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    ">",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Editar cuenta",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    ">",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Configuración y privacidad",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    ">",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  InkWell(
                    child: const Expanded(
                      child: Text(
                        "Cerrar Sesión",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        
                      ),
                    ),
                    onTap: () => handleLogout(),
                  ),
                  const Text(
                    ">",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
