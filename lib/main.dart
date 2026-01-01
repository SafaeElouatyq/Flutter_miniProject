

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/pages/contacts_page.dart';
import 'package:flutter_mini_project/pages/notes_page.dart';
import 'package:flutter_mini_project/pages/posts.dart';
import 'package:flutter_mini_project/theme/app_colors.dart';
import 'package:flutter_mini_project/theme/app_theme.dart';

void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
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
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child:CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/avatar.jpeg"),
              ) ,
            ),
            ListTile(
              leading: Icon(Icons.home,color: AppColors.primary),
              title: Text("Home"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
            ),

            ListTile(
              leading: Icon(Icons.contacts,color: AppColors.primary),
              title: Text("Contacts"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ContactsPage()));
              },
            ), ListTile(
              leading: Icon(Icons.article,color: AppColors.primary),
              title: Text("Posts"),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Posts()));

              },
            ),
            ListTile(
              leading: Icon(Icons.person,color: AppColors.primary),
              title: Text("Github users"),
            ),
            ListTile(
              leading: Icon(Icons.cloud,color: AppColors.primary),
              title: Text("weather"),
            ),
            ListTile(
              leading: Icon(Icons.chat,color: AppColors.primary),
              title: Text("chatbot"),
            ),ListTile(
              leading : Icon(Icons.edit_note,color: AppColors.primary),
              title: Text("Notes"),
              onTap: (){
               Navigator.pop(context);
               Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesPage()));
               },
            ),
          ],
        ),
      ),
    );
  }
}



