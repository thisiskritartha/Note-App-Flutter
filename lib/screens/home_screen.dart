import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/add_new_note_screen.dart';
import '../controller/note_controller.dart';
import '../models/model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    controller.fetchNote('krit@gmail.com');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Note-App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 3,
            decoration: TextDecoration.overline,
            decorationThickness: 3,
            decorationColor: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            AddNewNoteScreen(isUpdate: false),
            transition: Transition.downToUp,
          );
        },
        elevation: 30,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(
        () => controller.isLoading.value == false
            ? SafeArea(
                child: controller.notes.value.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          Note currentNote = controller.notes[index];
                          return GestureDetector(
                            onTap: () {
                              //TODO: FOR UPDATE
                              Get.to(() => AddNewNoteScreen(
                                    isUpdate: true,
                                    note: currentNote,
                                  ));
                            },
                            onLongPress: () {
                              controller.deleteNote(currentNote);
                              Get.snackbar(
                                'NOTE DELETE',
                                'Success!',
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: Colors.blue,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.only(left: 10, top: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 25,
                                    color: Colors.grey,
                                    offset: Offset(5, 10),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentNote.title!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    currentNote.content!,
                                    maxLines: 7,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[800],
                                      decoration: TextDecoration.none,
                                      letterSpacing: 1.3,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            Icon(
                              Icons.hourglass_empty_outlined,
                              size: 350,
                              color: Colors.grey[300],
                              shadows: [
                                Shadow(
                                  color: Colors.grey[500]!,
                                  blurRadius: 30,
                                  offset: const Offset(10, 10),
                                )
                              ],
                            ),
                            const SizedBox(height: 100),
                            Text(
                              'No Notes created yet !',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
