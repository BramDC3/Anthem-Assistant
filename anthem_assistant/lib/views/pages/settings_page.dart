import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:anthem_assistant/utils/website_utils.dart';
import 'package:anthem_assistant/views/pages/about_page.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchValue = false;

  void _setSwitchState() async {
    if (Theme.of(context).brightness == Brightness.dark)
      setState(() {
        _switchValue = true;
      });
    else
      setState(() {
        _switchValue = false;
      });
  }

  void _changeTheme() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  Future _openAnthemSubreddit() async {
    WebsiteUtils.openWebPage("https://www.reddit.com/r/AnthemTheGame/");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _setSwitchState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: ListTile(
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text('About the app'),
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
            leading: Icon(Icons.public),
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
            leading: Icon(Icons.brightness_medium),
            trailing: Switch(
              activeColor: ColorConstants.accentColor,
              value: _switchValue,
              onChanged: (bool newValue) {
                setState(() {
                  _switchValue = newValue;
                });
                _changeTheme();
              },
            ),
            title: Text('Dark mode'),
            onTap: () {
              setState(() {
                _switchValue = !_switchValue;
              });
              _changeTheme();
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
