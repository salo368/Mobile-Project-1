// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/supp_controller.dart';

class NewReportDescPage extends StatefulWidget {
  final SuppController suppController;
  const NewReportDescPage({Key? key, required this.suppController}) : super(key: key);

  @override
  State<NewReportDescPage> createState() => _NewReportDescPageState();
}

class _NewReportDescPageState extends State<NewReportDescPage> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _subjectController.text = widget.suppController.subject.value;
    _descriptionController.text = widget.suppController.description.value;
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descripción'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed("/newReport");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              // widget.suppController.updateSubject(_subjectController.text);
              // widget.suppController.updateDescription(_descriptionController.text);
              // Agrega aquí la lógica adicional para guardar la información del informe, si es necesario

              
              var next = await widget.suppController.createReport();
              if (next){
                Get.toNamed("/technicalSupport");
              }
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Asunto',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese el asunto del informe',
                ),
                onChanged: (value) {
                  widget.suppController.updateSubject(value);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Descripción',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 300, // Reduce la altura si el teclado está abierto
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  expands: true,
                  maxLength: 300,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese la descripción del informe',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    widget.suppController.updateDescription(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
