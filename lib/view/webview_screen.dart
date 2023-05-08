import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final Uri uri;
  const WebViewScreen({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        //TODO handle this better
        body: WebViewWidget(
            controller: WebViewController()..loadRequest(uri)),
      ),
    );
  }
}
