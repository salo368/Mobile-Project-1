import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'coor_users_table.dart';
import 'coor_users_create.dart';

class CoorUsers extends StatefulWidget {
  const CoorUsers({Key? key}) : super(key: key);

  @override
  State<CoorUsers> createState() => _CoorUsersState();
}

class _CoorUsersState extends State<CoorUsers> {
  late RxBool showUsersTable;

  @override
  void initState() {
    super.initState();
    showUsersTable = true.obs;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 186, 212, 255),
          title: const Text('Coordinador de Usuarios de Soporte'),
          leading: IconButton(
            icon: Transform.rotate(
              angle: 3.1415927,
              child: const Icon(Icons.exit_to_app),
            ),
            onPressed: () {
              // Acción al presionar el botón de ir atrás
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.view_list_rounded),
                onPressed: () {
                  Get.toNamed("/coorHome");
                },
              ),
            ),
          ],
        ),
        body: Obx(() {
          return showUsersTable.value
              ? UsersTable(changeToUsersCreate: switchToUsersCreate)
              : UsersCreate(changeToUsersTable: switchToUsersTable);
        }),
      ),
    );
  }

  void switchToUsersTable() {
    showUsersTable.value = true;
  }

  void switchToUsersCreate() {
    showUsersTable.value = false;
  }
}
