import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen(this.doc, {super.key});
  final QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  QueryDocumentSnapshot get doc => widget.doc;

  @override
  Widget build(BuildContext context) {
    int colorId = doc["color_id"];
    return Scaffold(
      backgroundColor: AppStyle.cardColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[colorId],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              doc["note_title"],
              style: AppStyle.mainTitle,
            ),
            Text(
              doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            Text(
              doc["note_content"],
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
