// ignore_for_file: file_names
import 'package:flutter/material.dart';
//import 'package:get/get.dart';



class CoorHome extends StatefulWidget {
  const CoorHome({super.key});

  @override
  State<CoorHome> createState() => _CoorHomeState();
}

class _CoorHomeState extends State<CoorHome> {
  List<Widget> reportWidgets = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Coordinador de Reportes'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Acción al presionar el botón de ir atrás
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                // Agrega aquí la lógica para guardar la información del informe
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: reportWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return reportWidgets[index];
          },
        ),
      ),
    );
  }
}