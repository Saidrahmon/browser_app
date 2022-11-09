import 'package:browser_app/page/block_list/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockListView extends GetView<BlockListController> {
  const BlockListView({Key? key}) : super(key: key);

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add url"),
          content: TextField(
            controller: controller.textEditingController,
            keyboardType: TextInputType.url,
            maxLines: 1,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              label: const Text("Url"),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                if (controller.addUrl()) {
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        );
      },
    );
  }

  Widget addButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          showAddDialog(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      );

  Widget listItem(int index, Function onSelect) {
    return ListTile(
      title: Text(controller.blockList[index]),
      trailing: PopupMenuButton(
        onSelected: (value) {
          onSelect();
        },
        itemBuilder: (BuildContext bc) {
          return [
            const PopupMenuItem(
              value: '/delete',
              child: Text("Delete"),
            ),
          ];
        },
      ),
    );
  }

  Widget get view => Obx(() => controller.blockList.isNotEmpty
      ? ListView.separated(
          itemCount: controller.blockList.length,
          itemBuilder: (BuildContext context, int index) {
            return listItem(index, () {
              controller.deleteUrl(index);
            });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        )
      : const Center(
          child: Text("Block List is empty"),
        ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Block List"), backgroundColor: Colors.green),
      body: view,
      floatingActionButton: addButton(context),
    );
  }
}
