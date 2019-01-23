import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text("This page is going to be used for everything that " +
        "has to do with the social aspect of Anthem. I plan on adding" +
        "Guild functionality, a way to look up players to " +
        "see their stats, and maybe even a friends list and " +
        "messaging functionality. It all depends on what the " +
        "Anthem Api will allow me to do."),
      ),
    );
  }
}