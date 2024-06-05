import 'package:flutter/material.dart';
import '../../controllers/login_controller.dart';


class Login extends StatelessWidget {
  final LoginController loginController;
  const Login({Key? key, required this.loginController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variables para almacenar el correo y la contraseña ingresados por el usuario
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // Verificar si el ancho de la pantalla es el de un dispositivo móvil
    bool isMobileWidth = MediaQuery.of(context).size.width < 1000;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: isMobileWidth ? 1.0 : 0.4,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Correo',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Clave',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Llama a la función validateLogin del controlador de login
                          loginController.validateLogin(emailController.text, passwordController.text);
                        },
                        child: const Text('Aceptar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
