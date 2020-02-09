import 'package:flutter/material.dart';
import 'package:github_repos/repos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _user;
  TextEditingController _userController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _userController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "GITHUB REPOSITORY FINDER",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _userController,
                      style: TextStyle(
                        color: Theme.of(context).textSelectionColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "Type github user here",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 60,
                    height: 60,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      color: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).textSelectionColor,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _user = _userController.text;
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              (_user != null)
              ? ReposGridView(_user)
              : Container(
                child: Text("Waiting for username")
              )
            ],
          ),
        ),
      ),
    );
  }
}
