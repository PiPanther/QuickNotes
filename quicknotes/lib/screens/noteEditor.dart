import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/styles/app_styles.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int colorid = Random().nextInt(AppStyle.cardscolors.length);
  String date = DateTime.now().toString();
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.cardscolors[colorid],
        appBar: AppBar(
          backgroundColor: AppStyle.cardscolors[colorid],
          title: const Text(
            'Add a new note',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
                style: AppStyle.mainTexts,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                date,
                style: AppStyle.datetitle,
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: mainController,
                keyboardType: TextInputType.text,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Notes...',
                ),
                style: AppStyle.mainTexts,
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await FirebaseFirestore.instance.collection("Notes").add({
              'color': colorid,
              'date': date,
              'note-content': mainController.text.trim(),
              'note-title': titleController.text.trim(),
            }).then((value) {
              mainController.clear();
              titleController.clear();
              Navigator.pop(context);
            }).catchError((error) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(error.toString())));
            });
          },
          label: Text('Save'),
          icon: Icon(Icons.save),
        ));
  }
}
