import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
          Get.snackbar('Error', 'El correo ya existe', snackPosition: SnackPosition.BOTTOM);
          return false;
        }
      } else {
        print('Error al verificar el correo: ${checkResponse.statusCode}');
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

      if (response.statusCode == 200) {
        print('Usuario creado exitosamente.');
        cleanVariables();
        return true;
      } else {
        print('Error al crear el usuario: ${response.statusCode}');
        cleanVariables();
        return true;
      }

    } catch (e) {
      print('Error: $e');
      return false;
    }
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
      print(e);
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
         return "";// O cualquier valor que desees retornar en caso de error de estado
      }
    } catch (e) {
       return "";// O cualquier valor que desees retornar en caso de excepción
    }
  }

  void cleanVariables() {
    name.value = "";
    email.value = "";
    password.value = "";
  }
}
