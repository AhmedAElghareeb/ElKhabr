import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebScreen extends StatelessWidget {
  const WebScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
