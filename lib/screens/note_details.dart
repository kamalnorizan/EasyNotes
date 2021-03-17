import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
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
                items: [
                  DropdownMenuItem(
                    child: Text('Low'),
                    value: 'Low',
                  ),
                  DropdownMenuItem(
                    value: 'High',
                    child: Text('High'),
                  ),
                ],
                value: 'Low',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
