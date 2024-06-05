import 'package:flutter/material.dart';
import 'coor_user_resume.dart';
import '../../controllers/coor_controller.dart';

class UsersTable extends StatefulWidget {
  final VoidCallback changeToUsersCreate;
  final CoorController coorController;
  const UsersTable({Key? key, required this.changeToUsersCreate, required this.coorController}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsersTableState createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  int userCount = 1; // Variable para contar el número de informes
  List<Widget> usersWidgets = [];

  @override
  void initState() {
    super.initState();
    loadReportss(); // Llama a loadReports() solo cuando se inicia el estado por primera vez
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 46,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 106, 201, 109),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: ElevatedButton(
                       onPressed: () 
                      {
                        // widget.coorController.email.value="b@b.com";
                        // widget.coorController.name.value="Andres";
                        // widget.coorController.password.value="12345";
                        // widget.coorController.createUser();
                        widget.changeToUsersCreate();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(7.0),
                        backgroundColor: const Color.fromARGB(255, 144, 248, 148),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        Icons.person_add_alt_1,
                        color: Color.fromARGB(255, 96, 96, 96),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.27),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: ListView.builder(
                  itemCount: usersWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return usersWidgets[index];
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void addUser() {
    setState(() {
      usersWidgets.insert(0,UserResume(name: "Salomon David Saenz Giraldo",reportCount: 8, note: 4, index: userCount,),);
      userCount++;
    });
  }
  void loadReportss() {
    clearReports();
    var reports = widget.coorController.loadUsers();

    reports.then((List<Map<String, dynamic>> data) async {
      for (var report in data) {
        
        // Obtener información del nombre del usuario
        var nameee = await widget.coorController.userInfoByEmail(report['email']);
        
        setState(() {
          // Crear el widget UserResume después de obtener el nombre del usuario
          usersWidgets.insert(
            0,
            UserResume(
              name: report['name'],
              reportCount: nameee[1].toInt(),
              note: nameee[0],
              index: userCount,
            ),
          );
          userCount++;
        });
      }
    });
  }



  void clearReports() {
    setState(() {
      usersWidgets.clear();
      userCount = 1; // Reiniciar el contador a 1
    });
  }


}
