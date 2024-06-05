// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/supp_controller.dart';


// ignore: must_be_immutable
class NewReportPage extends StatelessWidget {
  final SuppController suppController;
  const NewReportPage({Key? key, required this.suppController}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos del Informe'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            suppController.cleanVariables();
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
              controller: TextEditingController(text: suppController.client.value.isNotEmpty ? suppController.client.value : null),
              onChanged: (value) {
                suppController.updateClient(value);
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
                text: suppController.cc.value.isNotEmpty ? suppController.cc.value : null,
              ),
              onChanged: (value) {
                suppController.updateCc(value);
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
                          suppController.updateDate(fechaSeleccionada);
                        }
                      },
                      child: Obx(() => Text(
                        'Fecha del Servicio: ${suppController.date.value.day.toString().padLeft(2, '0')}/${suppController.date.value.month.toString().padLeft(2, '0')}/${suppController.date.value.year}',
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
                        suppController.updateDate(fechaSeleccionada);
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
                          suppController.updateTime(horaSeleccionada);
                        }
                      },
                      child: Obx(() => Text(
                        'Hora del Servicio: ${suppController.time.value.hour % 12 == 0 ? 12 : suppController.time.value.hour % 12}:${suppController.time.value.minute < 10 ? '0${suppController.time.value.minute}' : suppController.time.value.minute} ${suppController.time.value.hour < 12 ? 'AM' : 'PM'}',
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
                        suppController.updateTime(horaSeleccionada);
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
