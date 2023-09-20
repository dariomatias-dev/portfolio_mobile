import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/widgets/error_message_loading_data_widget.dart';

import 'package:portfolio/src/models/technology/technology_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';
import 'package:portfolio/src/providers/technology_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/technology_screen/components/technology_body_content_widget/technology_body_content_widget.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({
    super.key,
    required this.technologyName,
  });

  final String technologyName;

  TechnologyModel? setTechnology(BuildContext context) {
    final technologies = DataProviderInheritedWidget.of(context)?.technologies;
    final technology = technologies?.firstWhere((item) {
      return item.name == technologyName;
    });

    return technology;
  }

  @override
  Widget build(BuildContext context) {
    final technology = setTechnology(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: technology != null
              ? TechnologyDataProviderInheritedWidget(
                  screenContext: context,
                  technology: technology,
                  child: const TechnologyBodyContentWidget(),
                )
              : ErrorMessageLoadingDataWidget(
                  messageVariation: 'da tecnologia',
                  screenContext: context,
                ),
        ),
      ),
    );
  }
}
