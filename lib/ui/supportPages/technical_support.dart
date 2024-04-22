// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'resume_report.dart';
import 'package:get/get.dart';

class TechnicalSupport extends StatefulWidget {
  const TechnicalSupport({super.key});

  @override
  State<TechnicalSupport> createState() => _TechnicalSupportState();
}

class _TechnicalSupportState extends State<TechnicalSupport> {
  int reportCount = 1; // Variable para contar el número de informes
  List<Widget> reportWidgets = [];

  @override
  Widget build(BuildContext context) {
    addReport();
    addReport();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Soporte Técnico'),
          leading: IconButton(
            icon: Transform.rotate(
              angle: 3.1415927, // 180 grados en radianes
              child: const Icon(Icons.exit_to_app),
            ),
            onPressed: () {
              Get.toNamed("/login");
            },
          ),
        ),
        body: ListView.builder(
          itemCount: reportWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return reportWidgets[index];
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //addReport();
            Get.toNamed("/newReport");
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void addReport() {
    setState(() {
      reportWidgets.insert(0, ResumeReport(reportNumber: reportCount.toString()));
      reportCount++; 
    });
  }
}