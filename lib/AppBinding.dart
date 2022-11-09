import 'package:browser_app/repository/Storage.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Storage());
  }
}