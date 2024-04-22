import 'package:flutter/material.dart';

class UserResume extends StatelessWidget {
  final String name;
  final int reportCount;
  final double note;
  final int index; // Agregar el parámetro de índice

  const UserResume({Key? key, required this.name, required this.reportCount, required this.note, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor; // Definir una variable para el color de fondo

    // Verificar si el índice es par
    if (index % 2 == 0) {
      backgroundColor =  const Color.fromARGB(255, 184, 211, 255); // Si es par, establecer el color azul
    } else {
      backgroundColor =  const Color.fromARGB(255, 210, 227, 255); // Si no es par, establecer el color rojo
    }

    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor, // Usar el color determinado
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // Agregar un Expanded widget para que el nombre ocupe el 60% del espacio
            flex: 2, // Ocupa el 60% del espacio
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0), // Espacio entre el nombre y los otros widgets
              child: Text(
                name,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis, // Truncar el texto si es demasiado largo
              ),
            ),
          ),
          Expanded(
            flex: 1, // El total de flex de ambos elementos
            child: Row(
              children: [
                const Expanded(
                  flex: 0,
                  child: Icon(
                    Icons.description,
                    color: Color.fromARGB(255, 58, 58, 58),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      '$reportCount',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:Padding(
              padding: const EdgeInsets.only(right: 10.0), // Espacio entre el nombre y los otros widgets
              child:Text(
              'Nota promedio: $note/5',
              style: const TextStyle(fontSize: 16),),
            ),
          ),
        ],
      ),
    );
  }
}

