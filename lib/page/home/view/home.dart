import 'package:browser_app/page/home/controller/controller.dart';

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
          child: Obx(
            () => Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 800,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: controller.checkUrl,
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Start",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.isSwitch.value = !controller.isSwitch.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Eslab qolish",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Switch(
                                      activeColor: Colors.green,
                                      value: controller.isSwitch.value,
                                      onChanged: (bool value) {
                                        controller.isSwitch.value =
                                        !controller.isSwitch.value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.black12),
                            InkWell(
                              onTap: controller.awakeScreen,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Screen timeout",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Switch(
                                      activeColor: Colors.green,
                                      value: controller.isAwake.value,
                                      onChanged: (bool value) {
                                        controller.awakeScreen();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.black12),
                            InkWell(
                              onTap: controller.changeScreenMode,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Full Screen",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Switch(
                                      activeColor: Colors.green,
                                      value: controller.isFullScreen.value,
                                      onChanged: (bool value) {
                                        controller.changeScreenMode();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.black12),
                            InkWell(
                              onTap: (){},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Incognito mode",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Switch(
                                      activeColor: Colors.green,
                                      value: false,
                                      onChanged: (bool value) {

                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.black12),
                            InkWell(
                              onTap: (){
                                print("aa");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                child: Row(
                                  children: [
                                    Text("Green List", style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 1, color: Colors.black12),
                            InkWell(
                              onTap: (){
                                print("aa");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                child: Row(
                                  children: [
                                    Text("History", style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
