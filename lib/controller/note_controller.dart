import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/model.dart';

class NoteController extends GetxController {
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingContentController = TextEditingController();

  FocusNode noteFocus = FocusNode();
  RxList notes = [].obs;

  @override
  void onClose() {
    textEditingTitleController.dispose();
    textEditingContentController.dispose();
    super.onClose();
  }

  void addNote(Note note) {
    notes.add(note);
    notes.refresh();
  }

  void updateNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[index] = note;
    notes.refresh();
  }

  void deleteNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(index);
    notes.refresh();
  }
}
