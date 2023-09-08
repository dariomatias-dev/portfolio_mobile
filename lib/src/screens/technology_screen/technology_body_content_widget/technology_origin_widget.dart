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
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 2,
            child: Column(
              children: [
                const Text(
                  'Criada por:',
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
          Column(
            children: [
              const Text(
                'Lançada em:',
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
        ],
      ),
    );
  }
}
