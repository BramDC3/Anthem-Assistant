import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text("I think it would be awesome to have a " +
        "dynamic map of Anthem on which you can interesting places, " +
        "'hidden' objects/codex entries, timers for word events " +
        "and inventory resets, ... We'll see what's possible " +
        "with the Anthem Api, but even without it, I'll still " +
        "look into this."),
      ),
    );
  }
}
