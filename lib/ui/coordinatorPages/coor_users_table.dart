import 'package:flutter/material.dart';
import 'coor_user_resume.dart';

class UsersTable extends StatefulWidget {
  final VoidCallback changeToUsersCreate;

  const UsersTable({Key? key, required this.changeToUsersCreate}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsersTableState createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  int userCount = 1; // Variable para contar el número de informes
  List<Widget> reportWidgets = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    addUser();
    addUser();
    addUser();
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
                      onPressed: widget.changeToUsersCreate,
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
                  itemCount: reportWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return reportWidgets[index];
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
    reportWidgets.insert(0,UserResume(name: "Salomon David Saenz Giraldo",reportCount: 8, note: 4, index: userCount,),);
    userCount++;
  });
}

}
