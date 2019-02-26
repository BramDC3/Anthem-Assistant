import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:anthem_assistant/utils/website_utils.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This page will be used to look for a group (LFG). " +
                "Think of something like Destiny LFG where users can filter " +
                "groups based on activities, region, language, player level, ... " +
                "to find a group and even post their own group. I know there will " +
                "be matchmaking in Anthem (thank you Anthem devs!) but LFG is " +
                "often very useful."),
            SizedBox(height: 12),
            Text("While this feature is being developed, you can already start " +
                "looking for people to play with on the Anthem PC LFG discord server. " +
                "As the name suggests, it's currently for PC players only. The feature " +
                "I'm working on will support all platforms. Stay tuned!"),
            SizedBox(height: 18),
            RaisedButton(
              onPressed: () {
                WebsiteUtils.openWebPage("https://discord.gg/wv73eu7");
              },
              color: ColorConstants.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              elevation: 10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/anthem_pc_lfg_logo.jpg',
                      width: 30, height: 30),
                  SizedBox(width: 6),
                  Text("Join Anthem PC LFG"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
