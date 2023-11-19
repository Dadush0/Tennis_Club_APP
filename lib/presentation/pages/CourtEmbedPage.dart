import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// This is just for Android and IOS and for other platform the CourtPage is
/// used because this can't be supported from other platforms.
class CourtEmbedPage extends StatelessWidget {
  CourtEmbedPage({super.key});

  late final WebViewController controller = WebViewController()
    ..loadRequest(
      Uri.parse('https://tb-asv-regenstauf.ebusy.de/lite-module/1975'),
    )
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    // TODO: Try to remove footer (this following line doesnt work)
    controller.runJavaScript(
        "document.getElementsByTagName('footer')[0].style.display='none'");
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
