import 'package:browser_app/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wakelock/wakelock.dart';

class HomeController extends SuperController {
  TextEditingController textEditingController = TextEditingController();
  var isSwitch = false.obs;
  var isAwake = false.obs;
  var isFullScreen = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    textEditingController.text = "https://";

    initData();

    var url = box.read("url");
    if (url != null) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Get.offAndToNamed(AppRoutes.WEBVIEW, arguments: [url.toString()]);
      });
    }
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  void checkUrl() {
    if (textEditingController.text.isURL) {
      if (isSwitch.value) {
        box.write("url", textEditingController.text);
      }

      Get.offAndToNamed(AppRoutes.WEBVIEW,
          arguments: [textEditingController.text]);
    }
  }

  void awakeScreen() {
    isAwake.value = !isAwake.value;
    if (isAwake.value) {
      Wakelock.enable();
      box.write("is_awake", true);
    } else {
      Wakelock.disable();
      box.write("is_awake", false);
    }
  }

  void changeScreenMode() async {
    isFullScreen.value = !isFullScreen.value;
    if (isFullScreen.value) {
      box.write("is_full_screen", true);
      await FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);

    } else {
      box.write("is_full_screen", false);
      await FullScreen.exitFullScreen();

    }
  }

  void initData() async {
    if (box.read("is_awake") ?? false) {
      Wakelock.enable();
      isAwake.value = true;
    } else {
      Wakelock.disable();
      isAwake.value = false;
    }

    if (box.read("is_full_screen") ?? false) {
      isFullScreen.value = true;
      await FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    } else {
      isFullScreen.value = false;
      await FullScreen.exitFullScreen();
    }
  }
}
