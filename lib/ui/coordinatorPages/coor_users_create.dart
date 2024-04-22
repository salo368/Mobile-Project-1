import 'package:flutter/material.dart';

class UsersCreate extends StatelessWidget {
  final VoidCallback changeToUsersTable;

  const UsersCreate({Key? key, required this.changeToUsersTable}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: changeToUsersTable,
                  ),
                ),
                const SizedBox(width: 4.0),
                const Text(
                  'Crear un nuevo usuario',
                  style: TextStyle(
                    fontSize: 19.0,
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
                color: Color.fromARGB(255, 243, 138, 33),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Widget azul que ocupa todo el alto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
