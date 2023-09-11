import 'package:flutter/material.dart';

class ProjectInfosDetailsWidget extends StatelessWidget {
  const ProjectInfosDetailsWidget({
    super.key,
    required this.details,
  });

  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'O que irá encontrar:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 2.0,
            left: 12.0,
          ),
          child: ListView.separated(
            itemCount: details.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 2.0);
            },
            itemBuilder: (context, index) {
              final detail = details[index];

              return Text(
                '• $detail',
                style: const TextStyle(
                  color: Colors.white,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
