import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../controller/note_controller.dart';
import '../models/model.dart';

class AddNewNoteScreen extends StatelessWidget {
  AddNewNoteScreen({Key? key, required this.isUpdate, this.note})
      : super(key: key);
  bool isUpdate;
  final Note? note;
  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    if (isUpdate) {
      controller.textEditingTitleController.text = note!.title!;
      controller.textEditingContentController.text = note!.content!;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FocusManager.instance.primaryFocus!.unfocus();
            controller.textEditingContentController.clear();
            controller.textEditingTitleController.clear();
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (isUpdate) {
                  note!.title = controller.textEditingTitleController.text;
                  note!.content = controller.textEditingContentController.text;
                  controller.updateNote(note!);
                } else {
                  controller.addNote(Note(
                    id: const Uuid().v1(),
                    email: 'krit@gmail.com',
                    title: controller.textEditingTitleController.text,
                    content: controller.textEditingContentController.text,
                    dateAdded: DateTime.now(),
                  ));
                }
                FocusManager.instance.primaryFocus!.unfocus();
                controller.textEditingContentController.clear();
                controller.textEditingTitleController.clear();
                Get.back();
              },
              icon: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: controller.textEditingTitleController,
              autofocus: isUpdate ? false : true,
              onSubmitted: (val) {
                if (val != '') {
                  controller.noteFocus.requestFocus();
                }
              },
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
            Expanded(
                child: TextField(
              focusNode: controller.noteFocus,
              maxLines: null,
              controller: controller.textEditingContentController,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: 'Content',
                hintStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ))
          ],
        ),
      )),
    );
  }
}
