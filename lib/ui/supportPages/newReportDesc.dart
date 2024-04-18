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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                
              },
            ),
          ],
        ),
        body: const Padding(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}