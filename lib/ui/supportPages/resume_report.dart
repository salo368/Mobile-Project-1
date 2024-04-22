import 'package:flutter/material.dart';

class ResumeReport extends StatefulWidget {
  final String reportNumber;

  const ResumeReport({Key? key, required this.reportNumber}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ResumeReportState createState() => _ResumeReportState();
}

class _ResumeReportState extends State<ResumeReport> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: isHovered ? Colors.grey.withOpacity(0.2) : Colors.transparent,
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: ListTile(
                title: Text('Asunto Reporte'),
                subtitle: Text('22/04/2024 - 9:14 PM'),
              ),
            ),
            const Expanded(
              flex: 1,
              child: ListTile(
                title: Text(
                  'Calificación',
                  textAlign: TextAlign.center, // Centrar el texto en anchura
                ),
                subtitle: Text(
                  '-/5',
                  textAlign: TextAlign.center, // Centrar el texto en anchura
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(), // Elemento vacío con flex de 1
            ),
          ],
        ),
      ),
    );
  }
}
