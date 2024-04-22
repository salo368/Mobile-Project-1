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
                color: Color.fromARGB(255, 186, 212, 255),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Center(
                child: Container(
                  width: screenWidth * 0.5, // 50% del ancho de la pantalla
                  margin: const EdgeInsets.only(bottom: 100,top: 100,left: 100,right: 100), // Margen del 25%
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre completo',
                            style: TextStyle(
                              fontSize: 16,
                              
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Correo electronico',
                            style: TextStyle(
                              fontSize: 16,
                              
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contraseña',
                            style: TextStyle(
                              fontSize: 16,
                              
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            obscureText: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end, // Alinea el botón a la derecha
                       children: [
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el botón 'Crear'
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Color verde para el botón
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5), // Radio de esquina menos 5
                              ),
                            ),
                            child: const Text(
                              'Crear',
                              style: TextStyle(color: Color.fromARGB(255, 21, 21, 21),fontSize: 16,),
                               // Color gris para el texto
                            ),
                          ),
                        ],
                      ),
                    ],
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

