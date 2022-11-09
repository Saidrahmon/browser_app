import 'package:browser_app/AppRoutes.dart';
import 'package:browser_app/page/block_list/bindings/binding.dart';
import 'package:browser_app/page/block_list/view/view.dart';
import 'package:browser_app/page/home/binding/binding.dart';
import 'package:browser_app/page/home/view/home.dart';
import 'package:browser_app/page/webview/binding/binding.dart';
import 'package:browser_app/page/webview/view/webview.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.WEBVIEW,
      page: () => Webview(),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: AppRoutes.BLOCK_LIST,
      page: () => BlockListView(),
      binding: BlockListBinding(),
    )
  ];
}
