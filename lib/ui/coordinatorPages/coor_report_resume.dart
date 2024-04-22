import 'package:flutter/material.dart';

class ReportResume extends StatefulWidget {
  final String name;
  final String date;
  final double note;
  final int index; // Agregar el parámetro de índice

  const ReportResume({
    Key? key,
    required this.name,
    required this.date,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReportResumeState createState() => _ReportResumeState();
}

class _ReportResumeState extends State<ReportResume> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor; // Definir una variable para el color de fondo

    // Verificar si el índice es par
    if (widget.index % 2 == 0) {
      backgroundColor = const Color.fromARGB(255, 184, 211, 255); // Si es par, establecer el color azul
    } else {
      backgroundColor = const Color.fromARGB(255, 210, 227, 255); // Si no es par, establecer el color rojo
    }

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovering = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          print("Presionado");
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _hovering ? const Color.fromARGB(255, 132, 153, 176) : backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    widget.name,
                    style: const TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Text(
                          widget.date,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    widget.note < 0 ? 'Calificacion -/5' : 'Calificacion: ${widget.note}/5',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
