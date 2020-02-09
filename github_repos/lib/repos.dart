import 'package:github_repos/repos_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class ReposGridView extends StatefulWidget {

  final String user;
  ReposGridView(this.user);

  @override
  _ReposGridViewState createState() => _ReposGridViewState();
}

class _ReposGridViewState extends State<ReposGridView> {

  Future post;

  @override
  void initState() {
    super.initState();
    post = getData(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data.length; i++) {
            print(snapshot.data[i]["full_name"]);
          }
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ReposCard(snapshot.data[index]);
            },
          );
          // return Container(color: Colors.green, height: 100);
        }
        else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        else {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.yellow)
              ),
            ),
          );
        }
      },
    );
  }
}


Future getData(String user) async {
  var response = await http.get(
    "https://api.github.com/users/$user/repos?per_page=100"
  );
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  else {
    throw Exception("Failed to get data");
  }
}