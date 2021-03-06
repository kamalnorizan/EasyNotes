import 'package:easynotes/models/note.dart';
import 'package:easynotes/screens/note_details.dart';
import 'package:easynotes/utils/mysql_helper.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  Mysqlhelper mysqlhelper = Mysqlhelper();
  int count = 0;
  List<Note> notelist;

  @override
  Widget build(BuildContext context) {
    if (notelist == null) {
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Note('', '', 2), 'Create Note');
        },
        backgroundColor: Colors.deepOrange,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(
              this.notelist[position].title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            subtitle: Text(this.notelist[position].date),
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey),
              onTap: () async {
                int result =
                    await mysqlhelper.deleteNote(this.notelist[position].id);
                updateListView();
                if (result != 0) {
                  _showSnackbar(context, 'Note Deleted Successfully');
                }
              },
            ),
            onTap: () {
              navigateToDetail(this.notelist[position], 'Edit Note');
            },
          ),
        );
      },
    );
  }

  void updateListView() {
    Future<List<Note>> noteListFuture = mysqlhelper.getNoteList();
    noteListFuture.then(
      (notelist) => setState(() {
        this.notelist = notelist;
        this.count = notelist.length;
      }),
    );
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
