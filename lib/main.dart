import 'package:browser_app/AppBinding.dart';
import 'package:browser_app/AppPages.dart';
import 'package:browser_app/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
  //SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.HOME,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      initialBinding: AppBinding(),
    );
  }
}
