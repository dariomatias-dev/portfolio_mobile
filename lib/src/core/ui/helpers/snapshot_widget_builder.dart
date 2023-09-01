import 'package:flutter/material.dart';

class SnapshotWidgetBuilder {
  Widget builder(
    AsyncSnapshot<List<dynamic>> snapshot,
    String sectionType,
    Widget contentWidget,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    } else if (snapshot.hasError) {
      return Center(
        child: Text(
          'Não foi possível carregar a seção $sectionType.',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(
        child: Text(
          'Secão $sectionType indisponível.',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    return contentWidget;
  }
}
