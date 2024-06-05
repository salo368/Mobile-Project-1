import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CoorController extends GetxController {


  final String apiUrl = 'https://api-generator.retool.com/9bgTKx/reports';
  final String apiUrlUsers = 'https://api-generator.retool.com/6sABpg/users';

  late Map<String, dynamic> currentReport; 

  // Función para crear un usuario
  void createUser(String name, String email, String role) {
    // Implementa la lógica para crear un usuario
    print('Creando usuario: $name, $email, $role');
    // Aquí podrías llamar a una API o realizar alguna otra operación
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

      if (response.statusCode == 200) {
        print('Calificación actualizada correctamente para el informe con ID: ');
      } else {
        print('Hubo un error al actualizar la calificación para el informe con ID: ');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Función para cargar los usuarios
  void loadUsers() {
    // Implementa la lógica para cargar los usuarios
    print('Cargando usuarios...');
    // Aquí podrías llamar a una API o realizar alguna otra operación
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
         return "";// O cualquier valor que desees retornar en caso de error de estado
      }
    } catch (e) {
       return "";// O cualquier valor que desees retornar en caso de excepción
    }
  }

}
