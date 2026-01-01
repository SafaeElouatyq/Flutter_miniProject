import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/models/github.dart';
import 'package:flutter_mini_project/network/github_service.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  State<GithubPage> createState() => _GithubPageState();
}

class _GithubPageState extends State<GithubPage> {
  late GithubService api;
  late Future<List<Github>>githubs;

  @override
  void initState() {
    super.initState();
    api = GithubService(Dio());
    githubs = api.getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GitHub Users"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Github>>(
        future: githubs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  title: Text(user.login),
                  subtitle: Text(user.htmlUrl),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
