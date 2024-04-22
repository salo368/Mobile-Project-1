// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'coor_report_table.dart';

class CoorHome extends StatefulWidget {
  const CoorHome({super.key});

  @override
  State<CoorHome> createState() => _CoorHomeState();
}

class _CoorHomeState extends State<CoorHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 186, 212, 255), // Cambio de color a azul claro
          title: const Text('Coordinador de Reportes'),
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
                icon: const Icon(Icons.people_alt),// storage,person_add_alt_1
                onPressed: () {
                  Get.toNamed("/coorUsers");
                },
              ),
            ),
          ],
        ),
        body: const ReportTable(), // Aquí se cambia ListView.builder por Container vacío
      ),
    );
  }
}