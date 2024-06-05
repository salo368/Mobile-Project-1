import 'package:flutter/material.dart';
import 'coor_report_resume.dart';
import '../../controllers/coor_controller.dart';

class ReportTable extends StatefulWidget {
  final VoidCallback changeToReport;
  final CoorController coorController;
  const ReportTable({Key? key, required this.changeToReport, required this.coorController}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReportTableState createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  int reportCount = 1; // Variable para contar el número de informes
  List<Widget> reportWidgets = [];
  int valorFiltro = 1;
  TextEditingController _textFieldController = TextEditingController();

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
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        onPressed: () {
                          loadReportss();
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
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: TextField(
                                controller: _textFieldController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  hintText: 'Buscar',
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(fontSize: 15),
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
                        setState(() {
                          valorFiltro = value;
                        });
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
  
  void loadReportss() {
    clearReports();
    var reports;
    if (_textFieldController.text == ""){
      reports = widget.coorController.loadReports();
    }else{
      if (valorFiltro==2){
        reports = widget.coorController.loadReportsByEmail(_textFieldController.text);
      }else{
        reports = widget.coorController.loadReportsById(_textFieldController.text);
      }
      
    }
     // Usa el controlador proporcionado por el widget
    
    // Iterar sobre los informes y actualizar el estado para cada uno
    reports.then((List<Map<String, dynamic>> data) {
      setState(() {
        for (var report in data) {
          widget.coorController.loadFirstReportNameByEmail(report['email']).then((nameee) {
            setState(() {
              reportWidgets.insert(
                0,
                ReportResume(
                  name: nameee,
                  date: report['date'],
                  note: double.tryParse(report['qualification']) ?? -1,
                  index: reportCount,
                  changeToReport: widget.changeToReport,
                  coorController: widget.coorController,
                  reporte: report,
                ),
              );
              reportCount++;
            });
          });
        }
      });
    });
   
  }

  void clearReports() {
    setState(() {
      reportWidgets.clear();
      reportCount = 1; // Reiniciar el contador a 1
    });
  }
  
}
