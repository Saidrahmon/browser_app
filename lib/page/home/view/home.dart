import 'package:browser_app/AppRoutes.dart';
import 'package:browser_app/page/home/controller/controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  Widget textAndSwitch({required String text, required Function onTap, required RxBool value}) => Obx(
        () => InkWell(
          onTap: () {
            onTap();
            //controller.isSwitch.value = !controller.isSwitch.value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                ),
                Switch(
                  activeColor: Colors.green,
                  value: value.value,
                  onChanged: (bool value) {
                    onTap();
                    //controller.isSwitch.value = !controller.isSwitch.value;
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget get search => Form(
        key: controller.formKey,
        child: Container(
          decoration: const BoxDecoration(),
          child: TextFormField(
            controller: controller.textEditingController,
            keyboardType: TextInputType.url,
            maxLines: 1,
            cursorColor: Colors.green,
            validator: controller.validateUrl,
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.green),
                borderRadius: BorderRadius.circular(30),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      );

  Widget get button => ElevatedButton(
        onPressed: controller.checkUrl,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Start",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      );

  Widget get settingsCard => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              textAndSwitch(
                text: "Eslab qolish",
                onTap: () {
                  controller.isSwitch.value = !controller.isSwitch.value;
                },
                value: controller.isSwitch,
              ),
              Container(height: 1, color: Colors.black12),
              textAndSwitch(
                text: "Screen timeout",
                onTap: () {
                  controller.awakeScreen();
                },
                value: controller.isAwake,
              ),
              Container(height: 1, color: Colors.black12),
              textAndSwitch(
                text: "Full Screen",
                onTap: () {
                  controller.changeScreenMode();
                },
                value: controller.isFullScreen,
              ),
              Container(height: 1, color: Colors.black12),
              textAndSwitch(
                text: "Incognito mode",
                onTap: () {
                  controller.isIncognito.value = !controller.isIncognito.value;
                },
                value: controller.isIncognito,
              ),
              Container(height: 1, color: Colors.black12),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.BLOCK_LIST);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    children: const [
                      Text("Block List", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              Container(height: 1, color: Colors.black12),
              InkWell(
                onTap: () {
                  print("aa");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    children: const [
                      Text("History", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get view => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                search,
                const SizedBox(height: 16),
                button,
                const SizedBox(height: 16),
                settingsCard,
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: view,
      ),
    );
  }
}
