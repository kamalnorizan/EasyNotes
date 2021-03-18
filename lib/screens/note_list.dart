import 'package:easynotes/models/note.dart';
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
          print('Button Clicked!');
        },
        backgroundColor: Colors.deepOrange,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: 5,
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
            trailing: Icon(Icons.delete, color: Colors.grey),
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
      }),
    );
  }
}
