import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controllers/coor_controller.dart';

// ignore: must_be_immutable
class Report extends StatelessWidget {
  final VoidCallback changeToReportTable;
  final CoorController coorController;
  
  Report({Key? key, required this.changeToReportTable, required this.coorController}) : super(key: key);

  TextEditingController _textFieldController = TextEditingController();

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
                           ListTile(
                            title: Text(
                              'Nombre del cliente: ${coorController.currentReport["client"]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Id: ${coorController.currentReport["cc"]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                           ListTile(
                            title: Text(
                              'Fecha: ${coorController.currentReport["date"]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                           ListTile(
                            title: Text(
                              'Hora: ${coorController.currentReport["time"]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                           ListTile(
                            title: Text(
                              'Asunto: ${coorController.currentReport["subject"]}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                           ListTile(
                            title: const Text(
                              'Descripción:',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              coorController.currentReport["description"],
                              style: const TextStyle(fontSize: 18),
                            
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SizedBox(
                                  width: 64.0,
                                  child: TextField(
                                    controller: _textFieldController,
                                    decoration:  InputDecoration(
                                      hintText: coorController.currentReport["qualification"],
                                      contentPadding: EdgeInsets.zero,
                                      
                                    ),
                                    textAlign: TextAlign.center,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'^([0-5](\.[0-9])?)$')),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await coorController.updateReportQualification(_textFieldController.text);
                                  changeToReportTable();
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
