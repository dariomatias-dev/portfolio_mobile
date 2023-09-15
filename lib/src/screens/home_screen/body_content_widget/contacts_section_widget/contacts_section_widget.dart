import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/widgets/section_data_unavailable_widget.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/contacts_section_widget/contact_card_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class ContactsSectionWidget extends StatefulWidget {
  const ContactsSectionWidget({super.key});

  @override
  State<ContactsSectionWidget> createState() => ContactksSectionWidgetState();
}

class ContactksSectionWidgetState extends State<ContactsSectionWidget> {
  @override
  Widget build(BuildContext context) {
    const sectionName = 'Contatos';
    const imageName = 'contacts';

    final contacts = DataProviderInheritedWidget.of(context)?.contacts;

    return contacts == null
        ? const SectionDataUnavailableWidget(
            sectionName: sectionName,
          )
        : Column(
            children: [
              const SectionHeaderWidget(
                sectionName: sectionName,
                imageName: imageName,
              ),
              const SizedBox(height: 20.0),
              Text(
                sectionDescriptionsContant.contacts,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade800,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];

                    return ContactCardWidget(
                      contactName: contact.name,
                      contactLink: contact.link,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
