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
          SizedBox(
            width: sizedBoxWidth,
            child: Column(
              children: [
                const Text(
                  'Criado por:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  createdBy,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          SizedBox(
            width: sizedBoxWidth,
            child: Column(
              children: [
                const Text(
                  'Lançado em:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  createdIn,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
