import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends SuperController {
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    textEditingController.text = "https://";
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
