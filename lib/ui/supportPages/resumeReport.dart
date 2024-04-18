// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ResumeReport extends StatelessWidget {
  final String reportNumber;

  const ResumeReport({super.key, required this.reportNumber});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Resume Report $reportNumber'),
      subtitle: const Text('This is a report with details.'),
      onTap: () {
        // Acción al presionar el widget de resumen
      },
    );
  }
}
