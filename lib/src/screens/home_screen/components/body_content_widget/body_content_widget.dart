import 'package:flutter/material.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/home_screen/components/body_content_widget/email_widget.dart';
import 'package:portfolio/src/screens/home_screen/components/body_content_widget/projects_section_widget.dart';
import 'package:portfolio/src/screens/home_screen/components/body_content_widget/contacts_section_widget/contacts_section_widget.dart';
import 'package:portfolio/src/screens/home_screen/components/body_content_widget/technologies_section_widget/technologies_section_widget.dart';

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({
    super.key,
    required this.screenContext,
  });

  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    final profile = DataProviderInheritedWidget.of(context)?.profile;

    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        right: 20.0,
        left: 20.0,
      ),
      child: profile == null
          ? const Center(
              child: Text(
                'Não foi possível carregar as informações do perfil',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    EmailWidget(
                      email: profile.email,
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white54,
                    ),
                    Text(
                      profile.location,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  profile.description,
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
                const SizedBox(height: 20.0),
                const Divider(),
                const SizedBox(height: 30.0),
                ProjectsSectionWidget(
                  screenContext: screenContext,
                ),
                const SizedBox(height: 30.0),
                const Divider(),
                const SizedBox(height: 30.0),
                const TechnologiesSectionWidget(),
                const SizedBox(height: 30.0),
                const Divider(),
                const SizedBox(height: 30.0),
                const ContactsSectionWidget(),
                const SizedBox(height: 40.0),
              ],
            ),
    );
  }
}
