import 'package:browser_app/AppRoutes.dart';
import 'package:browser_app/page/home/controller/controller.dart';
import 'package:browser_app/page/webview/view/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: TextField(
                  controller: controller.textEditingController,
                  keyboardType: TextInputType.url,
                  maxLines: 1,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(AppRoutes.WEBVIEW);
                },
                child: Text("Search"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
