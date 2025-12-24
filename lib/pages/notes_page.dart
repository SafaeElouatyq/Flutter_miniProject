import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/pages/add_note.dart';
import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {


  List<Note> Notes=[
    Note(
        title: "note number 1",
        text: "do abc",
        checked: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body:ListView.builder(itemCount : Notes.length,itemBuilder: (context,index){
        final n = Notes[index];
        return Card(
          margin:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: ListTile(
            onTap: () {
              setState(() {
                n.checked = !n.checked;
              });
            },
            leading: Icon(
              n.checked
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: n.checked ? Colors.green : Colors.grey,
            ),
            title: Text(
              n.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration:
                n.checked ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              n.text,
              style: TextStyle(
                fontSize: 15,
                decoration:
                n.checked ? TextDecoration.lineThrough : null,
                color: Colors.grey[700],
              ),
            ),
          ),
        );

      })
      ,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.grey,
        shape: const CircleBorder(),
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNote()),
          );

          if (newNote != null) {
            setState(() {
              Notes.add(newNote);
            });
          }
        },
      ),

    );
  }
}
