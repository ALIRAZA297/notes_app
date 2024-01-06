// ignore_for_file: avoid_print

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/style/app_style.dart';

class NoteEditoe extends StatefulWidget {
  const NoteEditoe({super.key});

  @override
  State<NoteEditoe> createState() => _NoteEditoeState();
}

class _NoteEditoeState extends State<NoteEditoe> {
  @override
  Widget build(BuildContext context) {
    int colorId = Random().nextInt(AppStyle.cardColor.length);
    String date = DateTime.now().toString();
    TextEditingController titleController = TextEditingController();
    TextEditingController mainController = TextEditingController();
    return Scaffold(
      backgroundColor: AppStyle.cardColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColor[colorId],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add New Note",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              style: AppStyle.mainTitle,
            ),
            Text(date, style: AppStyle.dateTitle),
            const SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Content',
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title": titleController.text,
            "creation_date": date,
            "note_content": mainController.text,
            "color_id": colorId
          }).then((value) {
            if (kDebugMode) {
              print(value.id);
            }
            Navigator.pop(context);
            // ignore: invalid_return_type_for_catch_error
          }).catchError(
              // ignore: invalid_return_type_for_catch_error
              (error) => print("Failed to add new Note due to $error"));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
