import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:anthem_assistant/utils/website_utils.dart';
import 'package:anthem_assistant/views/pages/about_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future _openAnthemSubreddit() async {
    WebsiteUtils.openWebPage("https://www.reddit.com/r/AnthemTheGame/");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: ListTile(
            leading: IconTheme(
              data: IconThemeData(color: ColorConstants.primaryColorRed),
              child: Icon(Icons.info),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54),
            ),
          ),
        ),
        Container(
          child: ListTile(
            leading: IconTheme(
              data: IconThemeData(color: ColorConstants.primaryColorRed),
              child: Icon(Icons.public),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('Anthem subreddit'),
            onTap: () {
              _openAnthemSubreddit();
            },
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54),
            ),
          ),
        ),
        Container(
          child: ListTile(
            leading: IconTheme(
              data: IconThemeData(color: ColorConstants.primaryColorRed),
              child: Icon(Icons.brightness_medium),
            ),
            trailing: Switch(
              activeColor: ColorConstants.primaryColorRed,
              value: true,
              onChanged: (bool newValue) {
                setState(() {
                  //_switchValue = newValue;
                });
                //_changeBrightnessAndColor();
              },
            ),
            title: Text('Dark mode'),
            onTap: () {
              setState(() {
                //_switchValue = !_switchValue;
              });
              //_changeBrightnessAndColor();
            },
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}
