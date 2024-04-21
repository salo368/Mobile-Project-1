// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoorUsers extends StatefulWidget {
  const CoorUsers({super.key});

  @override
  State<CoorUsers> createState() => _CoorUsersState();
}

class _CoorUsersState extends State<CoorUsers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 186, 212, 255), // Cambio de color a azul claro
          title: const Text('Coordinador de Usuarios de Soporte'),
          leading: IconButton(
            icon: Transform.rotate(
              angle: 3.1415927, // 180 grados en radianes
              child: const Icon(Icons.exit_to_app),
            ),
            onPressed: () {
              // Acción al presionar el botón de ir atrás
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0), // Padding de 10px a la derecha
              child: IconButton(
                icon: const Icon(Icons.view_list_rounded),// storage,person_add_alt_1
                onPressed: () {
                  Get.toNamed("/coorHome");
                },
              ),
            ),
          ],
        ),
        body: Container(), // Aquí se cambia ListView.builder por Container vacío
      ),
    );
  }
}
