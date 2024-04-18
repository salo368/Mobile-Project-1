// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NewReportController extends GetxController {
  var nombreCliente = "".obs;
  var idCliente = "".obs;
  var fechaServicio = DateTime.now().obs;
  var horaServicio = TimeOfDay.now().obs;

  void updateNombreCliente(String nombre) {
    nombreCliente.value = nombre;
  }

  void updateIdCliente(String id) {
    idCliente.value = id;
  }

  void updateFechaServicio(DateTime fecha) {
    fechaServicio.value = fecha;
  }

  void updateHoraServicio(TimeOfDay hora) {
    horaServicio.value = hora;
  }
}

// ignore: must_be_immutable
class NewReportPage extends StatelessWidget {
  NewReportController newReportController = Get.put(NewReportController());

  NewReportPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Informe'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed("/technicalSupport");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Get.toNamed("/newReportDesc");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Nombre Cliente',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre del cliente',
              ),
              controller: TextEditingController(text: newReportController.nombreCliente.value.isNotEmpty ? newReportController.nombreCliente.value : null),
              onChanged: (value) {
                newReportController.updateNombreCliente(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Identificacion del cliente',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese la identificación del cliente',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: TextEditingController(
                text: newReportController.idCliente.value.isNotEmpty ? newReportController.idCliente.value : null,
              ),
              onChanged: (value) {
                newReportController.updateIdCliente(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? fechaSeleccionada = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.input,
                        );

                        if (fechaSeleccionada != null) {
                          newReportController.updateFechaServicio(fechaSeleccionada);
                        }
                      },
                      child: Obx(() => Text(
                        'Fecha del Servicio: ${newReportController.fechaServicio.value.day.toString().padLeft(2, '0')}/${newReportController.fechaServicio.value.month.toString().padLeft(2, '0')}/${newReportController.fechaServicio.value.year}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      )),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? fechaSeleccionada = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        initialEntryMode: DatePickerEntryMode.input,
                      );

                      if (fechaSeleccionada != null) {
                        newReportController.updateFechaServicio(fechaSeleccionada);
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final TimeOfDay? horaSeleccionada = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.input,
                        );

                        if (horaSeleccionada != null) {
                          newReportController.updateHoraServicio(horaSeleccionada);
                        }
                      },
                      child: Obx(() => Text(
                        'Hora del Servicio: ${newReportController.horaServicio.value.hour % 12 == 0 ? 12 : newReportController.horaServicio.value.hour % 12}:${newReportController.horaServicio.value.minute < 10 ? '0${newReportController.horaServicio.value.minute}' : newReportController.horaServicio.value.minute} ${newReportController.horaServicio.value.hour < 12 ? 'AM' : 'PM'}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      )),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    onPressed: () async {
                      final TimeOfDay? horaSeleccionada = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );

                      if (horaSeleccionada != null) {
                        newReportController.updateHoraServicio(horaSeleccionada);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
