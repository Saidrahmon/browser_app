import 'package:browser_app/page/webview/controller/controller.dart';
import 'package:get/get.dart';

class WebViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WebviewController());
  }
}