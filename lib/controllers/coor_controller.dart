import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class CoorController extends GetxController {
  final String apiUrl = 'https://api-generator.retool.com/9bgTKx/reports';
  final String apiUrlUsers = 'https://api-generator.retool.com/6sABpg/users';

  late Map<String, dynamic> currentReport;

  // Función para crear un usuario
  var email = "".obs;
  var name = "".obs;
  var password = "".obs;

  Future<bool> createUser() async {
    try {
      if (email.value.isEmpty || name.value.isEmpty || password.value.isEmpty) {
        Get.snackbar(
          'Error',
          'Por favor complete todos los campos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
        return false;
      }

      // Validar el formato del correo electrónico
      if (!isValidEmail(email.value)) {
        Get.snackbar(
          'Error',
          'Por favor ingrese un correo electrónico válido',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
        return false;
      }

      // Datos del usuario a crear
      final reportData = {
        'email': email.value,
        'name': name.value,
        'password': password.value,
        'type': false
      };

      // Verificar si el correo ya existe
      final checkResponse = await http.get(
        Uri.parse('$apiUrlUsers?email=${email.value}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (checkResponse.statusCode == 200) {
        final responseBody = jsonDecode(checkResponse.body);

        // Verificar si la lista de usuarios no está vacía
        if (responseBody is List && responseBody.isNotEmpty) {
          // Mostrar snack si el correo ya existe
          Get.snackbar(
            'Error',
            'El correo ya existe',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
          );
          return false;
        }
      } else {
        Get.snackbar(
          'Error',
          'Error al verificar el correo: ${checkResponse.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
        return false;
      }

      // Crear el usuario si el correo no existe
      final response = await http.post(
        Uri.parse(apiUrlUsers),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(reportData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        
        cleanVariables();
        return true;
      } else {
        Get.snackbar(
          'Error',
          'Error al crear el usuario: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
        cleanVariables();
        return true;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
      );
      return false;
    }
  }


  bool isValidEmail(String email) {
    // Aquí puedes implementar tu propia lógica de validación de correo electrónico
    // Por ejemplo, puedes utilizar expresiones regulares o alguna librería de validación de correo electrónico.
    // Aquí hay un ejemplo básico utilizando expresiones regulares:
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
  // Función para establecer una calificación a un usuario
  Future<void> updateReportQualification(String nota) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/${currentReport['id']}'),
        body: jsonEncode({
          'qualification': nota,
          "cc": currentReport['cc'],
          "date": currentReport['date'],
          "time": currentReport['time'],
          "email": currentReport['email'],
          "client": currentReport['client'],
          "subject": currentReport['subject'],
          "description": currentReport['description'],
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
       
      } else {
        Get.snackbar(
          'Error',
          'Hubo un error al actualizar la calificación para el informe con ID: ${currentReport['id']}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
      );
    }
  }

  // Función para cargar los usuarios
  Future<List<Map<String, dynamic>>> loadUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrlUsers));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        // Filtrar los usuarios cuyo 'type' sea false
        List<Map<String, dynamic>> filteredData = data.cast<Map<String, dynamic>>()
            .where((user) => user['type'] == false)
            .toList();
        return filteredData;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<double>> userInfoByEmail(String email) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?email=$email'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        double totalQualification = 0;

        // Calculating total qualification
        for (var report in data) {
          double qualification = double.tryParse(report['qualification']) ?? 0.0;
          totalQualification += qualification;
        }

        // Calculating average qualification
        double averageQualification = data.isEmpty ? 0 : totalQualification / data.length;
        return [averageQualification, data.length.toDouble()];
      } else {
        return [0, 0]; // Return default values if request fails
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
      );
      return [0, 0]; // Return default values if exception occurs
    }
  }

  // Función para cargar los informes
  Future<List<Map<String, dynamic>>> loadReports() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

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

  Future<List<Map<String, dynamic>>> loadReportsByEmail(String email) async {
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

  Future<List<Map<String, dynamic>>> loadReportsById(String cc) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?cc=$cc'));

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

  Future<String> loadFirstReportNameByEmail(String email) async {
    try {
      final response = await http.get(Uri.parse('$apiUrlUsers?email=$email'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return data.first['name'];
        } else {
          return ""; // O cualquier valor que desees retornar en caso de que la lista esté vacía
        }
      } else {
        return ""; // O cualquier valor que desees retornar en caso de error de estado
      }
    } catch (e) {
      return ""; // O cualquier valor que desees retornar en caso de excepción
    }
  }

  void cleanVariables() {
    name.value = "";
    email.value = "";
    password.value = "";
  }
}
