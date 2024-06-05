import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'ui/my_app.dart';

void main() async {
  // Inicializa Hive antes de ejecutar runApp()
  await Hive.initFlutter();
  // Registra los adaptadores de Hive aquí si es necesario
  runApp(const MyApp());
}
