import 'dart:convert';
import 'package:browser_app/AppRoutes.dart';
import 'package:browser_app/repository/Storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wakelock/wakelock.dart';

class HomeController extends SuperController {
  final box = GetStorage();

  Storage storage = Get.find();

  TextEditingController textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isSwitch = false.obs;
  var isAwake = false.obs;
  var isFullScreen = false.obs;
  var isIncognito = false.obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.text = "https://";
    print("mmmm" + storage.url);
    if (storage.url.isNotEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Get.offAndToNamed(AppRoutes.WEBVIEW, arguments: [storage.url]);
      });
    }
    initData();

    //var url = box.read("url");

  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  String? validateUrl(String? url) {
    if (url == null || url.isEmpty) {
      return 'Url is empty!';
    } else if (!url.isURL) {
      return 'Url is not url!';
    } else if (!checkBlockList(url)) {
      return 'Url is blocked!';
    }
    return null;
  }

  void checkUrl() {
    if (formKey.currentState!.validate()) {
      if (isSwitch.value) {
        storage.url = textEditingController.text;
        // box.write("url", textEditingController.text);
      }
      Get.offAndToNamed(AppRoutes.WEBVIEW, arguments: [textEditingController.text]);
    }
  }

  bool checkBlockList(String url) {
    var map = box.read("block_list");
    if (map != null) {
      List<String> blockLists = jsonDecode(map).cast<String>() ?? [];
      for (String blockUrl in blockLists) {
        if (blockUrl == url) {
          return false;
        }
      }
    }

    return true;
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
