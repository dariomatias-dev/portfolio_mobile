import 'package:flutter/material.dart';
import 'package:portfolio/src/screens/home_screen/network_links_widget/network_links_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkLinksWidget extends StatelessWidget {
  const NetworkLinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: networkLinksConstant.map(
          (networkLinkConstant) {
            return ListTile(
              leading: Image.asset(
                '${networkLinkConstant.iconPath}_icon.png',
                width: 26,
                height: 26,
              ),
              title: Text(networkLinkConstant.name),
              titleTextStyle: const TextStyle(
                color: Colors.white,
              ),
              trailing: const Icon(
                Icons.link,
                color: Colors.white,
              ),
              onTap: () async {
                await launchUrl(
                  Uri.parse(networkLinkConstant.link),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
