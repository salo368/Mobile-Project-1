// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewReportDescPage extends StatefulWidget {
  const NewReportDescPage({Key? key}) : super(key: key);

  @override
  State<NewReportDescPage> createState() => _NewReportDescPageState();
}

class _NewReportDescPageState extends State<NewReportDescPage> {
  double _keyboardHeight = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight = screenHeight - MediaQuery.of(context).viewInsets.bottom - appBarHeight;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Asunto',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese el asunto del informe',
                ),
              ),
              const Padding(
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
                height: _keyboardHeight > 0 ? availableHeight - 20 : 300, // Reduce la altura si el teclado está abierto
                child: TextField(
                  maxLines: null,
                  expands: true,
                  maxLength: 300,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese la descripción del informe',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () {
                    setState(() {
                      _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
                    });
                  },
                  onEditingComplete: () {
                    setState(() {
                      _keyboardHeight = 0;
                    });
                  },
                  onSubmitted: (_) {
                    setState(() {
                      _keyboardHeight = 0;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
