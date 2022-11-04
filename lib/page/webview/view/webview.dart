import 'package:browser_app/page/webview/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class Webview extends GetView<WebviewController> {
  const Webview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://uzinfocom.uz/uz/")),
      ),
    );
  }
}
