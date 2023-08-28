import 'package:portfolio/src/models/network_link_model.dart';

const String basePath = 'assets/icons';

final List<NetworkLinkModel> networkLinksConstant = [
  NetworkLinkModel(
    iconPath: '$basePath/github',
    link: 'https://github.com/dariomatias-dev/',
    name: 'GitHub',
  ),
  NetworkLinkModel(
    iconPath: '$basePath/instagram',
    link: 'https://www.instagram.com/dariomatias_dev/',
    name: 'Instagram',
  ),
  NetworkLinkModel(
    iconPath: '$basePath/linkedin',
    link: 'https://www.linkedin.com/in/dariomatias-dev/',
    name: 'Linkedin',
  ),
  NetworkLinkModel(
    iconPath: '$basePath/website',
    link: 'https://portfolio-dariomatias-dev.vercel.app/',
    name: 'Website',
  ),
];
