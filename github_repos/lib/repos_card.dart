import 'package:flutter/material.dart';

class ReposCard extends StatelessWidget {

  final Map repo;
  ReposCard(this.repo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

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
                padding: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    width: 80,
                    height: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${repo["name"].toUpperCase()}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Stars: ${repo["stargazers_count"]}",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Text(
                      "Forks: ${repo["forks_count"]}",
                      style: TextStyle(
                        color: Colors.white
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