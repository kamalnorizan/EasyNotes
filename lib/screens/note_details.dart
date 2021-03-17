import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  print(value);
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
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
