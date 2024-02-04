import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  void addNoteToUser(User user, String title, String content, int color) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .update({
        'notes': FieldValue.arrayUnion([
          {
            'color': color,
            'date': DateTime.now().toString(),
            'note-title': title,
            'note-content': content,
          }
        ]),
      });
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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
          onPressed: () {
            addNoteToUser(
                FirebaseAuth.instance.currentUser!,
                titleController.text.trim(),
                mainController.text.trim(),
                colorid);
          },
          label:const  Text('Save'),
          icon:const  Icon(Icons.save),
        ));
  }
}
