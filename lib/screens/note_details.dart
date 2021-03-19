import 'package:easynotes/models/note.dart';
import 'package:easynotes/utils/mysql_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget {
  final String title;
  final Note note;

  NoteDetails(this.note, this.title);

  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.note, this.title);
}

class _NoteDetailsState extends State<NoteDetails> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  static var _priorities = ['High', 'Low'];
  final String title;
  final Note note;
  Mysqlhelper mysqlhelper = Mysqlhelper();

  _NoteDetailsState(this.note, this.title);

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.description;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 10,
          right: 10,
        ),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String drpdownStringItem) {
                  return DropdownMenuItem<String>(
                    child: Text(drpdownStringItem),
                    value: drpdownStringItem,
                  );
                }).toList(),
                value: getPriorityAsString(note.priority),
                onChanged: (value) {
                  setState(() {
                    updatePriorityAsInt(value);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  updateTitle();
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                onChanged: (value) {
                  updateDescription();
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('saved!');
                        _save();
                      },
                      child: Text('Save'),
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _delete();
                      },
                      child: Text('Delete'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
      default:
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
      default:
    }

    return priority;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _save() async {
    note.date = DateFormat('y-M-d').format(DateTime.now());

    int result;
    if (note.id != null) {
      result = await mysqlhelper.updateNote(note);
    } else {
      result = await mysqlhelper.insertNote(note);
    }
    moveToLastScreen();
    if (result != 0) {
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _delete() async {
    int result = await mysqlhelper.deleteNote(note.id);
    moveToLastScreen();
    _showAlertDialog('Status', 'Note Deleted!');
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
