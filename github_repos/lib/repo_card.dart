import 'package:flutter/material.dart';
import 'package:github_repos/repo_details.dart';
import 'package:github_repos/repo_model.dart';

class ReposCard extends StatelessWidget {

  final RepoModel repo;
  ReposCard(this.repo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RepoDetails(repo: repo)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Color(0xFF000B3F),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset("assets/logos/${repo.language}.png"),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${repo.name.toUpperCase()}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Stars: ${repo.stargazersCount}",
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor
                      ),
                    ),
                    Text(
                      "Forks: ${repo.forksCount}",
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}