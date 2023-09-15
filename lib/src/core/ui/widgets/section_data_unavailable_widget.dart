import 'package:flutter/material.dart';

class SectionDataUnavailableWidget extends StatelessWidget {
  const SectionDataUnavailableWidget({
    super.key,
    required this.sectionName,
  });

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Não foi possível carregar a seção ${sectionName.toLowerCase()}.',
      ),
    );
  }
}
