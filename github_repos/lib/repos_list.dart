import 'package:github_repos/repo_model.dart';
import 'package:github_repos/repo_card.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Repositories of ${widget.user}",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isEmpty) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text(
                    "User Not Found",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      // fontWeight: FontWeight.w600
                    ),
                  )
                ),
              );
            }
            else {
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ReposCard(snapshot.data[index]);
                },
              );
            }
            // return Container(color: Colors.green, height: 100);
          }
          else if (snapshot.hasError) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text(
                  "Something got wrong:\n${snapshot.error}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textSelectionColor,
                    fontSize: 20
                  ),
                ),
              ),
            );
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
      )
    );
  }
}


Future<List<RepoModel>> getData(String user) async {
  var response = await http.get(
    "https://api.github.com/users/$user/repos?per_page=100"
  );
  var data = json.decode(response.body);
  if (response.statusCode == 200) {
    List<RepoModel> list = new List<RepoModel>();
    for (int i = 0; i < data.length; i++) {
      list.add(RepoModel.fromJson(data[i]));
    }
    return list;
  }
  else {
    if (data["message"] == "Not Found") {
      return [];
    }
    throw Exception("Failed to get data");
  }
}