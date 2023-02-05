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

  final searchQuery = ''.obs;

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

  List<Note> getFilteredNotes() {
    return notes
        .where(
          (el) =>
              el.title!.toLowerCase().contains(searchQuery.toLowerCase()) ||
              el.content!.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  void sortNote() {
    notes.value.sort((a, b) => b.dateAdded!.compareTo(a.dateAdded!));
  }

  void addNote(Note note) async {
    notes.add(note);
    sortNote();
    await ApiService.add(note);
  }

  void updateNote(Note note) {
    int index =
        notes.indexOf(notes.firstWhere((element) => element.id == note.id));
    notes[index] = note;
    sortNote();
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
    sortNote();
    isLoading.value = false;
  }
}
