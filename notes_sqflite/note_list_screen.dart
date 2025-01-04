import 'package:flutter/material.dart';

import 'add_note_screen.dart';
import 'database_helper.dart';
import 'note_details_screen.dart';
import 'note_model.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    final notes = await db.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notes App List Screen"),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notes[index]['title'].toString()),
            subtitle: Text(_notes[index]['content'].toString()),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoteDetailsScreen(
                    noteModel: NoteModel(
                      id: _notes[index]['id'],
                      content: _notes[index]['content'],
                      title: _notes[index]['title'],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
