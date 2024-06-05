import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'coor_users_table.dart';
import 'coor_users_create.dart';
import '../../controllers/coor_controller.dart';

class CoorUsers extends StatefulWidget {
  final CoorController coorController;
  const CoorUsers({Key? key, required this.coorController}) : super(key: key);

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
          title: const Text('Usuarios de Soporte Tecnico'),
          leading: IconButton(
            icon: Transform.rotate(
              angle: 3.1415927,
              child: const Icon(Icons.exit_to_app),
            ),
            onPressed: () {
              Get.toNamed("/login");
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
              ? UsersTable(changeToUsersCreate: switchToUsersCreate,coorController:widget.coorController)
              : UsersCreate(changeToUsersTable: switchToUsersTable,coorController:widget.coorController);
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
