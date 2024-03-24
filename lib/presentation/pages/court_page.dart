import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// This will for flutter web send the user to open the webpage externally
/// For flutter android and ios, the webview widget is used
class CourtPage extends StatelessWidget {
  CourtPage({super.key});
  final Uri _url =
      Uri.parse('https://tb-asv-regenstauf.ebusy.de/lite-module/1975');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _launchUrl,
        child: Text(AppLocalizations.of(context)!.openCourtPage),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
