import 'package:flutter/material.dart';
import 'package:github_repos/repos_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _userController = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  _clearText() {
    _userController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    _clearText();
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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
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
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Type user";
                        }
                        return null;
                      },
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
                        if (_formKey.currentState.validate()) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ReposGridView(_userController.text)));
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
