import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// This is a temporary solution for flutter web to open the webpage externally
/// For flutter android and ios, the webview widget should be used
class CourtPage extends StatelessWidget {
  CourtPage({super.key});
  final Uri _url =
      Uri.parse('https://tb-asv-regenstauf.ebusy.de/lite-module/1975');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _launchUrl,
        child: const Text('Open Court Webpage'),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
