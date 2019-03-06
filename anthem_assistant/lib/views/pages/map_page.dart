import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        minScale: PhotoViewComputedScale.contained,
        maxScale: 2.0,
        imageProvider: AssetImage("assets/anthem_map_v3-min.jpg"),
      ),
    );
  }
}
