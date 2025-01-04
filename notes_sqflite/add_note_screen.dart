import 'package:flutter/material.dart';

import 'database_helper.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({
    super.key,
  });

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final DatabaseHelper db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note Screen"),
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
                        .addNote(
                      titleController.text,
                      contentController.text,
                    )
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Add Note"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
