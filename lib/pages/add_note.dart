import 'package:flutter/material.dart';
import '../models/note.dart';

class AddNote extends StatefulWidget {
  final Note? note;
  const AddNote({super.key, this.note});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      textController.text = widget.note!.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEdit = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Note" : "Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter the note title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter note description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isEdit) {
                      widget.note!.title = titleController.text;
                      widget.note!.text = textController.text;
                      Navigator.pop(context, widget.note);
                    } else {
                      final newNote = Note(
                        title: titleController.text,
                        text: textController.text,
                        checked: false,
                      );
                      Navigator.pop(context, newNote);
                    }
                  }
                },
                child: Text(isEdit ? "Update" : "Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
