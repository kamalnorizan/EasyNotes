import 'dart:convert';

import 'package:easynotes/models/note.dart';
import 'package:http/http.dart' as http;

class Mysqlhelper {
  static String url = "http://192.168.43.55/easynotes/simplenote.php";

  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';
  String colPriority = 'priority';

  Future<List<Note>> getNoteList() async {
    final response = await http.post("$url", body: {
      "process": "read",
    });
    List<Note> notes;

    if (response.body != "0") {
      final items = jsonDecode(response.body).cast<Map<String, dynamic>>();

      notes = items.map<Note>((item) {
        return Note.fromMapObject(item);
      }).toList();

      print(notes);
    }

    return notes;
  }

  Future insertNote(Note note) async {
    var response = await http.post("$url", body: {
      "process": "create",
      "title": note.title,
      "description": note.description,
      "date": note.date,
      "priority": note.priority.toString(),
    });

    String status = jsonDecode(response.body);
    if (status == 'Success') {
      return 1;
    } else {
      return 0;
    }
  }
}
