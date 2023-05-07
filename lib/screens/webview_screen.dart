import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        //TODO handle this better
        body: WebViewWidget(controller: WebViewController()..loadRequest(Uri.parse(url))),
      ),
    );
  }
}
