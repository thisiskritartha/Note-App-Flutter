import 'package:flutter/material.dart';
import 'package:notes_app/bindings/note_binding.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: NoteBindings(),
      home: HomeScreen(),
    );
  }
}
