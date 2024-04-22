import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Color de fondo del círculo
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.person,
                  size: 100, // Tamaño grande del icono de usuario
                  color: Colors.white, // Color del icono
                ),
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.4, // Hace que la tarjeta ocupe el 40% del ancho de la pantalla
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Campo de correo
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Correo',
                        ),
                      ),
                      const SizedBox(height: 20), // Separador
                      // Campo de clave
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Clave',
                        ),
                      ),
                      const SizedBox(height: 20), // Separador
                      // Botón de aceptar
                      ElevatedButton(
                        onPressed: () {
                          // Aquí puedes agregar la lógica para procesar el inicio de sesión
                        },
                        child: const Text('Aceptar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200), // Widget vacío de 100px
          ],
        ),
      ),
    );
  }
}

