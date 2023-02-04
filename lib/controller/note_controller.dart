import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model.dart';

class NoteController extends GetxController {
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingContentController = TextEditingController();

  FocusNode noteFocus = FocusNode();
  RxList notes = [].obs;

  void addNote(Note note) {
    notes.add(note);
    refresh();
  }

  void updateNote() {}

  void deleteNote() {}
}
