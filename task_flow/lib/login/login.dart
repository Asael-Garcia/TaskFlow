import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_flow/helpers/auth.helper.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _loading = false;
  final _form   = GlobalKey<FormState>();
  final TextEditingController _emailController    = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  handleLogin() async {
    if(!_form.currentState!.validate()) return;
    setState(() {
      _loading = true;
    });
    final email = _emailController.value.text;
    final password = _passwordController.value.text;
    await AuthHandler().signIn(email, password);
    setState(() {
      _loading = false;
    });
    Navigator.pushNamed(context, '/mainScreen');
  }
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
                      '../assets/user.png',
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
              child: Form(
                key: _form,
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
                        textInputAction: TextInputAction.next,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.send,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: !_loading?() => handleLogin() : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Ajusta el valor del radio para modificar la forma del óvalo
                          ),
                        ),
                        child: _loading? 
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ): 
                                const Text('Iniciar Sesión'),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}
