import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicknotes/screens/noteEditor.dart';
import 'package:quicknotes/screens/notescreen.dart';
import 'package:quicknotes/styles/app_styles.dart';
import 'package:quicknotes/widgets/notecard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.bgcolor,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'FireNotes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppStyle.bgcolor,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your recent notes',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Notes")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: snapshot.data!.docs
                            .map((e) => noteCard(() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return NoteReaderScreen(doc: e);
                                  }));
                                }, e))
                            .toList(),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No notes found..',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NoteEditorScreen();
            }));
          },
          label: Text('Add'),
          icon: Icon(Icons.add),
        ));
  }
}
