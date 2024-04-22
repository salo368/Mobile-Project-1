import 'package:flutter/material.dart';
import 'coor_report_resume.dart';

class ReportTable extends StatefulWidget {
  

  const ReportTable({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReportTableState createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  int reportCount = 1; // Variable para contar el número de informes
  List<Widget> reportWidgets = [];
  @override
  Widget build(BuildContext context) {
    addReport();
    addReport();
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
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        onPressed: () {
                          // Acción al presionar el IconButton
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromARGB(255, 128, 128, 128),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: 'Buscar',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PopupMenuButton<int>(
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('ID Cliente'),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Text('ID US'),
                        ),
                      ],
                      onSelected: (value) {
                        // Acción a realizar según la opción seleccionada
                      },
                      offset: const Offset(70, 43), // Ajusta el valor de Y según sea necesario
                      icon: const Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
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
  void addReport() {
    setState(() {
      reportWidgets.insert(0,ReportResume(name: "Salomon David Saenz Giraldo",date: "20/04/2024", note: -1, index: reportCount,),);
      // userCount++;
      reportCount++;
    });
  }
  
}
