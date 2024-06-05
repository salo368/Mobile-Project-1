import 'package:flutter/material.dart';
import 'resume_report.dart';
import 'package:get/get.dart';
import '../../controllers/supp_controller.dart';

class TechnicalSupport extends StatefulWidget {
  final SuppController suppController;
  const TechnicalSupport({Key? key, required this.suppController}) : super(key: key);

  @override
  State<TechnicalSupport> createState() => _TechnicalSupportState();
}

class _TechnicalSupportState extends State<TechnicalSupport> {
  int reportCount = 1; // Variable para contar el número de informes
  List<Widget> reportWidgets = [];

  @override
  void initState() {
    super.initState();
    loadReports(); // Llama a loadReports() solo cuando se inicia el estado por primera vez
  }

  @override
  Widget build(BuildContext context) {
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
              widget.suppController.deactivateConnectionCheck();
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
            Get.toNamed("/newReport");
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void loadReports() {
    clearReports();
    var email = widget.suppController.email.value; // Correo electrónico para filtrar los informes
    final reports = widget.suppController.loadReports(email); // Usa el controlador proporcionado por el widget
    
    // Iterar sobre los informes y actualizar el estado para cada uno
    reports.then((List<Map<String, dynamic>> data) {
      setState(() {
        for (var report in data) {
          reportWidgets.insert(
            0,
            ResumeReport(
              reportNumber: reportCount.toString(),
              date: report['date'],
              time: report['time'],
              qual: report['qualification'],
              subject: report['subject'],
              localData: false,
            ),
          );
          reportCount++;
        }
      });
    });

    loadLocalReports();
  }

  void loadLocalReports(){

    final reports = widget.suppController.loadLocalReports(); // Usa el controlador proporcionado por el widget
    
    // Iterar sobre los informes y actualizar el estado para cada uno
    reports.then((List<Map<String, dynamic>> data) {
      setState(() {
        for (var report in data) {
          reportWidgets.insert(
            0,
            ResumeReport(
              reportNumber: reportCount.toString(),
              date: report['date'],
              time: report['time'],
              qual: report['qualification'],
              subject: report['subject'],
              localData: true,
            ),
          );
          reportCount++;
        }
      });
    });
  }

  

  void clearReports() {
    setState(() {
      reportWidgets.clear();
      reportCount = 1; // Reiniciar el contador a 1
    });
  }
}
