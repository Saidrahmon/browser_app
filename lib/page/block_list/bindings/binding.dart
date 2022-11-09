import 'package:browser_app/page/block_list/controller/controller.dart';
import 'package:get/get.dart';

class BlockListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BlockListController());
  }
}