// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ResumeReport extends StatefulWidget {
  final String reportNumber;
  final String date;
  final String time;
  final String qual;
  final String subject;
  final bool localData;

  const ResumeReport({
    Key? key,
    required this.reportNumber,
    required this.date,
    required this.time,
    required this.qual,
    required this.subject,
    required this.localData, // Nuevo parámetro localData
  }) : super(key: key);

  @override
  _ResumeReportState createState() => _ResumeReportState();
}

class _ResumeReportState extends State<ResumeReport> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0), // Margen de 5 píxeles a los lados y 2 píxeles arriba y abajo
      child: MouseRegion(
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
          color: widget.localData ? Colors.orange : Colors.lightBlue.withOpacity(0.2), // Cambiar color basado en localData
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(widget.subject),
                  subtitle: Text('${widget.date} - ${widget.time}'),
                ),
              ),
              Expanded(
                flex: 1,
                child: ListTile(
                  title: const Text(
                    'Calificación',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    '${widget.qual}/5',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
