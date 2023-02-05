import 'dart:convert';
import '../models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = 'http://95fd-202-51-76-39.ngrok.io';

  static Future<void> add(Note note) async {
    Uri requestUri = Uri.parse('$baseUrl/create-note');
    // print(requestUri);
    var response = await http.post(requestUri, body: note.toJson());
    var decoded = jsonDecode(response.body);
    print(decoded.toString());
  }

  static Future<void> deleteNote(Note note) async {
    Uri requestUri = Uri.parse('$baseUrl/delete');
    var response = await http.post(requestUri, body: note.toJson());
    var decoded = jsonDecode(response.body);
    print(decoded.toString());
  }

  static Future<void> updateNote(Note note) async {
    Uri requestUri = Uri.parse('$baseUrl/update');
    var response = await http.patch(requestUri, body: note.toJson());
    var decoded = jsonDecode(response.body);
    print(decoded.toString());
  }

  static Future<List<Note>> fetchNote(String email) async {
    Uri requestUri = Uri.parse('$baseUrl/getNote/$email');
    var response = await http.get(requestUri);
    var decoded = jsonDecode(response.body);
    print(decoded['data']['note'].toString());
    List<Note> notes = [];
    for (Map<String, dynamic> note in decoded['data']['note']) {
      var fetchedNote = Note.fromJson(note);
      notes.add(fetchedNote);
    }
    return notes;
  }
}
