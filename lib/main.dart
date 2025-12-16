

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/pages/contacts_page.dart';

void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),

    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Project"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome to the home page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child:CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/avatar.jpeg"),
              ) ,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
            ),

            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contacts"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ContactsPage()));
              },
            ), ListTile(
              leading: Icon(Icons.article),
              title: Text("Posts"),

            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Github users"),
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text("weather"),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text("chatbot"),
            )
          ],
        ),
      ),
    );
  }
}



