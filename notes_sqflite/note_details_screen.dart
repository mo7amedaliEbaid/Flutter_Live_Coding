import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'note_model.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    titleController.text = widget.noteModel.title;
    contentController.text = widget.noteModel.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Details Screen"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: titleController,
                ),
                TextFormField(
                  controller: contentController,
                ),
                MaterialButton(
                  onPressed: () async {
                    await db
                        .updateNote(
                      widget.noteModel.id,
                      widget.noteModel.title,
                      widget.noteModel.content,
                    )
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("EditNote"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
