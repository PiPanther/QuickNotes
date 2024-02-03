import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/styles/app_styles.dart';

class NoteReaderScreen extends StatefulWidget {
  QueryDocumentSnapshot doc;
  NoteReaderScreen({super.key, required this.doc});

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardscolors[widget.doc['color']],
      appBar: AppBar(
        backgroundColor: AppStyle.cardscolors[widget.doc['color']],
        title: Text(
          widget.doc['note-title'],
          style: AppStyle.mainTexts,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['date'],
              style: AppStyle.datetitle,
            ),
            Text(
              widget.doc['note-content'],
              style: AppStyle.maincontent,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
