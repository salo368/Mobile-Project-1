// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'supportPages/newReport.dart';
import 'supportPages/newReportDesc.dart';
import 'coordinatorPages/coorHome.dart';
import 'supportPages/technicalSupport.dart';




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int reportCount = 1; // Variable para contar el número de informes
  List<Widget> reportWidgets = [];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/coorHome',
      getPages: [
        GetPage(name: '/technicalSupport', page: () => const TechnicalSupport()),
        GetPage(name: '/newReport', page: () => NewReportPage()),
        GetPage(name: '/newReportDesc', page: () => const NewReportDescPage()),
        GetPage(name: '/coorHome', page: () => const CoorHome())
      ],
    );
  }
}