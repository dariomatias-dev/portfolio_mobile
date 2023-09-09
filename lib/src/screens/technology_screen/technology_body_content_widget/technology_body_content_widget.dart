import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:portfolio/src/models/project/project_model.dart';
import 'package:portfolio/src/models/technology/technology_references_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';
import 'package:portfolio/src/providers/technology_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/technology_screen/technology_body_content_widget/technology_links_widget.dart';
import 'package:portfolio/src/screens/technology_screen/technology_body_content_widget/technology_origin_widget.dart';
import 'package:portfolio/src/screens/technology_screen/technology_body_content_widget/technology_projects_widget.dart';
import 'package:portfolio/src/screens/technology_screen/technology_body_content_widget/technology_utilizers_widget/technology_utilizers_widget.dart';

import 'package:portfolio/src/widgets/screen_header_template_widget.dart';

class TechnologyBodyContentWidget extends StatelessWidget {
  const TechnologyBodyContentWidget({super.key});

  void _showAlertDialog(BuildContext screenContext) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: const Text(
            'As informações sobre as empresas e aplicações que usam a tecnologia podem não estarem presentes, pelo motivo que nem sempre essas informações são divulgadas, sendo necessário olhar os códigos-fonte disponíveis.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenContext =
        TechnologyDataProviderInheritedWidget.of(context)!.screenContext;
    final technology =
        TechnologyDataProviderInheritedWidget.of(context)!.technology;
    final imageName = technology.imageName.imageDarkTheme ??
        technology.imageName.imageStandard;
    final TechnologyReferencesModel links = technology.references;

    final projects = DataProviderInheritedWidget.of(context)?.projects;
    final List<ProjectModel> technologyProjects = projects?.where(
          (element) {
            return element.technologies.contains(technology.name);
          },
        ).toList() ??
        [];

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 48.0,
          ),
          child: Column(
            children: [
              Image.network(
                '${dotenv.env['BASE_URL_IMAGES']}/technologies/${imageName}_logo.png',
                height: 100.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),
              Text(
                technology.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  right: 10.0,
                  left: 10.0,
                ),
                child: Text(
                  technology.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              if (technology.userCompanies != null ||
                  technology.userApplications != null)
                TechnologyUtilizersWidget(
                  userCompanies: technology.userCompanies,
                  userApplications: technology.userApplications,
                ),
              const SizedBox(height: 20.0),
              TechnologyOriginWidget(
                createdBy: technology.createdBy,
                createdIn: technology.releasedIn,
              ),
              const SizedBox(height: 20.0),
              TechnologyLinksWidget(
                githubRepository: links.githubRepository,
                officialWebsite: links.officialWebsite,
                playground: links.playground,
              ),
              if (technologyProjects.isNotEmpty)
                TechnologyProjectsWidget(
                  technologyProjects: technologyProjects,
                ),
            ],
          ),
        ),
        ScreenHeaderTemplateWidget(
          screenContext: screenContext,
          action: IconButton(
            onPressed: () {
              _showAlertDialog(screenContext);
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
