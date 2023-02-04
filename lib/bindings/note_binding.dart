import 'package:get/get.dart';
import 'package:notes_app/controller/note_controller.dart';

class NoteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NoteController>(NoteController());
  }
}
