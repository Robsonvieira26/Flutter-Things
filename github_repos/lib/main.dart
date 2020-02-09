import 'package:github_repos/home.dart';
import 'package:flutter/material.dart';

main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textSelectionColor: Colors.white,
        backgroundColor: Color(0xFF00103F)
      ),
      home: Home(),
    );
  }
}