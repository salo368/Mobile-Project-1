import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Report extends StatelessWidget {
  final VoidCallback changeToReportTable;

  const Report({Key? key, required this.changeToReportTable}) : super(key: key);

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
                    onPressed: changeToReportTable,
                  ),
                ),
                const SizedBox(width: 4.0),
                const Text(
                  'Reporte del Soporte',
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
              
                child: Container(
                  width: screenWidth * 0.5, // 50% del ancho de la pantalla
                  margin: const EdgeInsets.only(bottom: 60, top: 60,left: 100,right: 100), // Margen del 25%
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const ListTile(
                            title: Text(
                              'Nombre: Salomon David Saenz Giraldo',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const ListTile(
                            title: Text(
                              'Id: 123456',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const ListTile(
                            title: Text(
                              'Fecha: 22 de abril, 2024',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const ListTile(
                            title: Text(
                              'Hora: 10:00 AM',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const ListTile(
                            title: Text(
                              'Asunto: Asunto de ejemplo',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const ListTile(
                            title: Text(
                              'Descripción:',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              'Descripción de ejemplo. Este es un texto largo que muestra una descripción de ejemplo. Puede ser tan largo como necesites y la lista será desplazable.',
                              style: TextStyle(fontSize: 18),
                            
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SizedBox(
                                  width: 64.0,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: 'Puntaje',
                                      contentPadding: EdgeInsets.zero,
                                      
                                    ),
                                    textAlign: TextAlign.center,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'^\d{0,1}\.?\d{0,1}')),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Acción al presionar el botón
                                },
                                icon: const Icon(Icons.check),
                                iconSize: 32.0,
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
          ),  
        ],
    );
  }
}
