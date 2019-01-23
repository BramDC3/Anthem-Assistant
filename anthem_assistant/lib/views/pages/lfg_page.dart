import 'package:flutter/material.dart';

class LFGPage extends StatefulWidget {
  @override
  _LFGPageState createState() => _LFGPageState();
}

class _LFGPageState extends State<LFGPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text("This page will be used to look for a group (LFG). " +
            "Think of something like Destiny LFG where users can filter " +
            "groups based on activities, region, language, player level, ... " +
            "to find a group and even post their own group. I know there will " +
            "be matchmaking in Anthem (thank you Anthem devs!) but LFG is " +
            "often very useful."),
      ),
    );
  }
}
