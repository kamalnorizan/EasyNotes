import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'My List Tile',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            subtitle: Text('Letak tarikh note'),
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
}
