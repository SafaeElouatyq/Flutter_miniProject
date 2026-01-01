import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/models/post.dart';
import 'package:flutter_mini_project/network/post_service.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  late ApiService api;
  late Future<List<Post>> postsFuture;
  @override
  void initState(){
    super.initState();
    api = ApiService(Dio());
    postsFuture=api.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts Page"),
      ),
      body: FutureBuilder<List<Post>>(
        future: postsFuture,
        builder: (context,snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text("Error: ${snapshot.error}"),);
          }
          final posts= snapshot.data!;
          return ListView.builder(itemCount: posts.length,
            itemBuilder: (context,index){
            final post = posts[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(post.title ),
                subtitle: Text(post.body),
              ),
            );
            },
          );

        },

      ),
    );
  }
}
