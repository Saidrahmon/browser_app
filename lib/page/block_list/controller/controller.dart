import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BlockListController extends GetxController {
  RxList blockList = [].obs;
  final box = GetStorage();
  TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    textEditingController.text = "https://";

    var map = box.read("block_list");

    if(map != null){
      blockList.addAll(jsonDecode(box.read("block_list")).cast() ?? []);
    }
  }

  bool addUrl() {
    if (textEditingController.text.isURL) {
      blockList.add(textEditingController.text);
      textEditingController.clear();
      writeStorage();
      return true;
    }
    return false;
  }

  void deleteUrl(int index){
    blockList.removeAt(index);
    writeStorage();
  }

  void writeStorage(){
    box.write("block_list", jsonEncode(blockList));
  }
}
