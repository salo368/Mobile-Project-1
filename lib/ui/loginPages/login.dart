import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                          // Verificar las credenciales ingresadas por el usuario
                          if (emailController.text == 'user' &&
                              passwordController.text == '12345') {
                            // Usuario "a@a.com" redirigido a "/technicalSupport"
                            Get.toNamed("/technicalSupport");
                          } else if (emailController.text == 'a@a.com' &&
                              passwordController.text == '12345') {
                            // Usuario "b@b.com" redirigido a "/coorHome"
                            Get.toNamed("/coorHome");
                          } else {
                            // Si las credenciales son incorrectas, mostrar un mensaje de error
                            Get.snackbar(
                              'Error',
                              'Correo o contraseña incorrectos',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
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
