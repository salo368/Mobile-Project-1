// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewReportDescPage extends StatefulWidget {
  const NewReportDescPage({Key? key}) : super(key: key);

  @override
  State<NewReportDescPage> createState() => _NewReportDescPageState();
}

class _NewReportDescPageState extends State<NewReportDescPage> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Descripción'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed("/newReport");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Agrega aquí la lógica para guardar la información del informe
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Asunto',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el asunto del informe',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Descripción',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 300, // Reduce la altura si el teclado está abierto
                child: TextField(
                  maxLines: null,
                  expands: true,
                  maxLength: 300,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: 'Ingrese la descripción del informe',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
