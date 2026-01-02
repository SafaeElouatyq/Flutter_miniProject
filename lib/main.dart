import 'package:flutter/material.dart';
import 'pages/weather_page.dart';
import 'pages/contacts_page.dart';
import 'pages/github_page.dart';
import 'pages/notes_page.dart';
import 'pages/posts.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Project"), centerTitle: true),
      body: const Center(child: Text("Welcome to the home page")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/avatar.jpeg"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: AppColors.primary),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts, color: AppColors.primary),
              title: const Text("Contacts"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.article, color: AppColors.primary),
              title: const Text("Posts"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Posts()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: AppColors.primary),
              title: const Text("Github users"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => GithubPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud, color: AppColors.primary),
              title: const Text("Weather"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_note, color: AppColors.primary),
              title: const Text("Notes"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotesPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
