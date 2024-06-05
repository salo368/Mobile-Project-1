// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'supportPages/new_report.dart';
import 'supportPages/new_report_desc.dart';
import 'coordinatorPages/coor_home.dart';
import 'coordinatorPages/coor_users.dart';
import 'supportPages/technical_support.dart';
import 'loginPages/login.dart';
import '../controllers/login_controller.dart';
import '../controllers/supp_controller.dart';
import '../controllers/coor_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LoginController loginController;
  late final SuppController suppController;
  late final CoorController coorController; // Declara la instancia de LoginController

  @override
  void initState() {
    super.initState();
    suppController = Get.put(SuppController()); 
    coorController = Get.put(CoorController());// Inicializa LoginController usando Get.put
    loginController = Get.put(LoginController(suppController));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/technicalSupport', page: () => TechnicalSupport(suppController: suppController)),
        GetPage(name: '/newReport', page: () => NewReportPage(suppController: suppController)),
        GetPage(name: '/newReportDesc', page: () =>  NewReportDescPage(suppController: suppController)),
        GetPage(name: '/coorHome', page: () =>  CoorHome(coorController: coorController,)),
        GetPage(name: '/coorUsers', page: () =>  CoorUsers(coorController: coorController)),
        GetPage(name: '/login', page: () => Login(loginController: loginController)), // Pasa la instancia de LoginController a la página de login
      ],
    );
  }
}
