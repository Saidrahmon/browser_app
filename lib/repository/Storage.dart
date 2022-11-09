import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage extends GetxService{
  GetStorage box = GetStorage();

  String _url = "";


  @override
  void onInit() {
    super.onInit();
    loadData();
  }


  String get url => _url;

  set url(String url){
    _url = url;

    _saveStorage(_urlS, url);
  }

  void loadData(){
    _url = _loadFromStorage(_urlS) ?? "";
    print("nnnn" + _url);
  }

  void _saveStorage(String key, dynamic value) {
    try {
      box.write(key, value);
      print("aaaa" + value.toString());
    } catch (e) {
      print(e);
    }
  }

  dynamic _loadFromStorage(String key) {
    try {
      return box.read(key);
    } catch (e) {
      print(e);
    }
  }

  final String _urlS = "url";
  final String _blockListS = "block_list";
  final String _isAwakeS = "is_awake";
  final String _isFullScreenS = "is_full_screen";
}
