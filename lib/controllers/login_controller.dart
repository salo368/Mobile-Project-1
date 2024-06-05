import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'supp_controller.dart';

class LoginController extends GetxController {
  final SuppController suppController; // Declarar la variable suppController

  // Constructor con suppController como argumento
  LoginController(this.suppController);

  // Variables to store the username and password
  var username = ''.obs;
  var password = ''.obs;

  // Function to validate login
  Future<void> validateLogin(String email, String pass) async {
    // Check for empty fields
    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar(
        'Error',
        'Email or password cannot be empty',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        
      );
      return;
    }

    // Make the API request
    final response = await http.get(Uri.parse('https://api-generator.retool.com/6sABpg/users?email=$email'));

    if (response.statusCode == 200) {
      final List<dynamic> users = json.decode(response.body);

      if (users.isNotEmpty) {
        // Assuming the API returns a list of users with fields 'email', 'password', and 'type'
        final user = users.first;
        if (user['password'] == pass) {
          if (user['type']) {
            Get.toNamed("/coorHome");
          } else {
            suppController.checkConnection();
            suppController.updateEmail(email);
            Get.toNamed("/technicalSupport");
          }
        } else {
          Get.snackbar(
            'Error',
            'Correo o contraseña incorrectos',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Correo o contraseña incorrectos',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Failed conexion',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
