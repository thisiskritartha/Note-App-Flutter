import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/services/api_services.dart';
import '../models/model.dart';

class NoteController extends GetxController {
  TextEditingController textEditingTitleController = TextEditingController();
  TextEditingController textEditingContentController = TextEditingController();

  FocusNode noteFocus = FocusNode();

  final isLoading = true.obs;
  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNote('krit@gmail.com');
  }

  @override
  void onClose() {
    textEditingTitleController.dispose();
    textEditingContentController.dispose();
    super.onClose();
  }

  void addNote(Note note) async {
    notes.add(note);
    await ApiService.add(note);
  }

  void updateNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[index] = note;
    ApiService.updateNote(note);
  }

  void deleteNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes.removeAt(index);
    ApiService.deleteNote(note);
  }

  void fetchNote(String email) async {
    notes.value = await ApiService.fetchNote(email);
    isLoading.value = false;
  }
}
