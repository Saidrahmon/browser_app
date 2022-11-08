import 'package:get/get.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

class WebviewController extends SuperController {

 var url  = Get.arguments;

  @override
  void onInit() {
    startKioskMode();
    print("aaa onInit ${url[0]}");
    super.onInit();
  }

  @override
  void onDetached() {
    print("aaa onDetached");
  }

  @override
  void onInactive() {
    print("aaa onInactive");
  }

  @override
  void onPaused() {
    print("aaa onPaused");
  }

  @override
  void onResumed() {
    //startKioskMode();
    print("aaa onResumed");
  }
}
