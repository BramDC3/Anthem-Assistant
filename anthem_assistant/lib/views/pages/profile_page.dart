import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Text("On the Profile page, users will be able to " +
        "see their statistics and maybe even view a 3D model " +
        "of their javelin(s) and add functionality to customize them. " +
        "This would probably be very difficult, but if the Anthem Api " +
        "will allow it, I'm definitely willing to try!"),
      ),
    );
  }
}