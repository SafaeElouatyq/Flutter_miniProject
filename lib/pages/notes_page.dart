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
    Note(text: "note number 1"),
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
        return Column(
          children: [
            ListTile(

              leading: Icon(Icons.square_outlined),
              title: Text(n.text),
            )
          ],
        );
      })
      ,
      floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNote()));
      }),

    );
  }
}
