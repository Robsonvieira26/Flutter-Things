import 'package:flutter/material.dart';
import 'package:github_repos/repo_model.dart';

class RepoDetails extends StatelessWidget {

  final RepoModel repo;
  const RepoDetails({Key key, @required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "${repo.name}".toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  "assets/logos/${repo.language}.png",
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF000B3F),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      customText("Repo Name: ${repo.name}", context),
                      customText("Creation Date: ${convertDate(repo.createdAt)}", context),
                      customText("Last Update: ${convertDate(repo.updatedAt)}", context),
                      customText("Repo Size: ${repo.size}MB", context),
                      customText("Language: ${repo.language}", context),
                      customText("Total Forks: ${repo.forksCount}", context),
                      customText("Total Stars: ${repo.stargazersCount}", context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget customText(String text, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).textSelectionColor,
          fontSize: 20,
        )
      ),
    );
  }

  String convertDate(String originalDate) {
    String returnedDate = "";
    for (int i = 8; i < 10; i++) {returnedDate += originalDate[i];}
    returnedDate += "/";
    for (int i = 5; i < 7; i++) {returnedDate += originalDate[i];}
    returnedDate += "/";
    for (int i = 0; i < 4; i++) {returnedDate += originalDate[i];}

    return returnedDate;
  }
}