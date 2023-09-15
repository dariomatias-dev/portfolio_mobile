import 'package:flutter/material.dart';

class TechnologyOriginWidget extends StatelessWidget {
  const TechnologyOriginWidget({
    super.key,
    required this.createdBy,
    required this.createdIn,
  });

  final String createdBy;
  final String createdIn;

  @override
  Widget build(BuildContext context) {
    final sizedBoxWidth = MediaQuery.sizeOf(context).width / 2 - 25.0;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 8.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TechnologyOriginContentWidget(
            title: 'Criado por:',
            content: createdBy,
            sizedBoxWidth: sizedBoxWidth,
          ),
          const SizedBox(width: 10.0),
          TechnologyOriginContentWidget(
            title: 'Lançado em:',
            content: createdIn,
            sizedBoxWidth: sizedBoxWidth,
          ),
        ],
      ),
    );
  }
}

class TechnologyOriginContentWidget extends StatelessWidget {
  const TechnologyOriginContentWidget({
    super.key,
    required this.title,
    required this.content,
    required this.sizedBoxWidth,
  });

  final String title;
  final String content;
  final double sizedBoxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizedBoxWidth,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            content,
            softWrap: true,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
