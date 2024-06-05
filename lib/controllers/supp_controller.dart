import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:connectivity/connectivity.dart';

class SuppController extends GetxController {
  final String apiUrl = 'https://api-generator.retool.com/9bgTKx/reports';

  var email = "".obs;
  var client = "".obs;
  var cc = "".obs;
  var date = DateTime.now().obs;
  var time = TimeOfDay.now().obs;
  var subject = "".obs;
  var description = "".obs;
  var qualification = "-";

  var shouldCheckConnection = true.obs;


  Future<void> checkConnection() async {
    shouldCheckConnection.value = true;
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (shouldCheckConnection.value) {
      if (result == ConnectivityResult.none) {
        // Muestra una snackbar si no hay conexión
        Get.snackbar(
          'Conexión perdida', 
          'Por favor, verifica tu conexión a internet.',
          backgroundColor: Colors.red[100],
        );
        Future.delayed(const Duration(seconds: 5), () => checkConnection());
      } else {
        // Vuelve a verificar la conexión después de 5 segundos
        try {
          var reports = await loadLocalReports();

          if (reports.isNotEmpty) {
            // Iterar sobre cada reporte y enviarlo
            for (var report in reports) {
              await createReportPar(
                report['email'],
                report['client'],
                report['cc'],
                report['date'],
                report['time'],
                report['subject'],
                report['description'],
                report['qualification'],
              );
            }

            // Limpiar la caja de reportes locales
            var box = await Hive.openBox('local_reports');
            await box.clear();

            // Mostrar un SnackBar
            Get.snackbar(
              'Reportes Enviados',
              'Todos los reportes locales han sido enviados y la caja ha sido limpiada.',
              backgroundColor: Colors.red[100],
            );
          }
          await Future.delayed(const Duration(seconds: 5), () => checkConnection());
        } catch (e) {
          // Mostrar un SnackBar en caso de error
          Get.snackbar(
            'Error',
            'Error al enviar los reportes locales: $e',
            backgroundColor: Colors.red[100],
          );
        }
      }
    }
  }

  void deactivateConnectionCheck() {
    shouldCheckConnection.value = false;
  }

  Future<List<Map<String, dynamic>>> loadReports(String email) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?email=$email'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool> createReport() async {
    // Validar que todos los campos no estén vacíos
    if (email.value.isEmpty ||
        client.value.isEmpty ||
        cc.value.isEmpty ||
        subject.value.isEmpty ||
        description.value.isEmpty ) {
      Get.snackbar(
        'Error',
        'Todos los campos son obligatorios',
        backgroundColor: Colors.red[100],
        snackPosition: SnackPosition.BOTTOM,
      );
      return false; // Salir de la función si algún campo está vacío
    }

    try {
      final reportData = {
        'email': email.value,
        'client': client.value,
        'cc': cc.value,
        'date': '${date.value.day.toString().padLeft(2, '0')}/${date.value.month.toString().padLeft(2, '0')}/${date.value.year}',
        'time': '${time.value.hour % 12 == 0 ? 12 : time.value.hour % 12}:${time.value.minute < 10 ? '0${time.value.minute}' : time.value.minute} ${time.value.hour < 12 ? 'AM' : 'PM'}',
        'subject': subject.value,
        'description': description.value,
        'qualification': qualification,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(reportData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Manejo de la respuesta exitosa
      } else {
        Get.snackbar(
          'Error',
          'Error al crear el reporte: ${response.statusCode}',
          backgroundColor: Colors.red[100],
        );
      }
      cleanVariables();
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Fallo de subida, queda en local',
        backgroundColor: Colors.red[100],
      );
      await saveLocal();
      cleanVariables();
      return false;
    }
  }


  Future<void> createReportPar(
    String emailValue,
    String clientValue,
    String ccValue,
    String dateValue,
    String timeValue,
    String subjectValue,
    String descriptionValue,
    String qualificationValue,
  ) async {
    try {
      final reportData = {
        'email': emailValue,
        'client': clientValue,
        'cc': ccValue,
        'date': dateValue,
        'time': timeValue,
        'subject': subjectValue,
        'description': descriptionValue,
        'qualification': qualificationValue,
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(reportData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        
      } else {
        Get.snackbar(
          'Error',
          'Error al crear el reporte: ${response.statusCode}',
          backgroundColor: Colors.red[100],
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error al crear el reporte: $e',
        backgroundColor: Colors.red[100],
      );
    }
  }

  Future<void> saveLocal() async {
    try {
      var box = await Hive.openBox('local_reports');
      var newReport = {
        'email': email.value,
        'client': client.value,
        'cc': cc.value,
        'date': '${date.value.day.toString().padLeft(2, '0')}/${date.value.month.toString().padLeft(2, '0')}/${date.value.year}',
        'time': '${time.value.hour % 12 == 0 ? 12 : time.value.hour % 12}:${time.value.minute < 10 ? '0${time.value.minute}' : time.value.minute} ${time.value.hour < 12 ? 'AM' : 'PM'}',
        'subject': subject.value,
        'description': description.value,
        'qualification': qualification,
      };
      await box.add(newReport);
      Get.snackbar(
        'Reporte guardado',
        'Reporte guardado localmente.',
        backgroundColor: Colors.red[100],
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error al guardar el reporte localmente: $e',
        backgroundColor: Colors.red[100],
      );
    }
  }

  Future<List<Map<String, dynamic>>> loadLocalReports() async {
    try {
      var box = await Hive.openBox('local_reports');
      List<Map<String, dynamic>> localReports = [];
      for (var i = 0; i < box.length; i++) {
        localReports.add(box.getAt(i));
      }
      return localReports;
    } catch (e) {
      return []; // Retorna una lista vacía en caso de error
    }
  }

  void updateEmail(String valor) {
    email.value = valor;
  }

  void updateClient(String valor) {
    client.value = valor;
  }

  void updateCc(String valor) {
    cc.value = valor;
  }

  void updateDate(DateTime valor) {
    date.value = valor;
  }

  void updateTime(TimeOfDay valor) {
    time.value = valor;
  }

  void updateSubject(String valor) {
    subject.value = valor;
  }

  void updateDescription(String valor) {
    description.value = valor;
  }

  void cleanVariables() {
    client.value = "";
    cc.value = "";
    subject.value = "";
    description.value = "";
    qualification = "-";
  }
}
