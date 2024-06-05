import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:f_navigation_template/controllers/login_controller.dart';
import 'package:f_navigation_template/controllers/supp_controller.dart';
import 'package:f_navigation_template/ui/loginPages/login.dart';

void main() {
  testWidgets('Inicio de sesión con campos vacíos', (WidgetTester tester) async {

    SuppController suppController = SuppController();
    LoginController loginController = LoginController(suppController);

    await tester.pumpWidget(
      GetMaterialApp(
        home: Login(loginController: loginController),
      ),
    );

    final loginButton = find.byKey(const Key('login-button'));

    await tester.tap(loginButton);

    // Espera un poco más para permitir que se muestre el SnackBar
    await tester.pump(const Duration(milliseconds: 800));

    // Espera a que se complete la acción de inicio de sesión

    // Busca el SnackBar en el árbol de widgets de prueba
    final snackBarFinder = find.byType(SnackBar);
    // Verifica que se encuentre el SnackBar
    expect(snackBarFinder, findsOneWidget);

    // Verifica que se muestre el mensaje adecuado en el SnackBar
    expect(find.text('Email or password cannot be empty'), findsOneWidget);

  });
}