import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/logo_anthem_assistant_white.png',
                    scale: 1.2),
                SizedBox(height: 8),
                Text("Anthem Assistant", style: TextStyle(fontSize: 26)),
                SizedBox(height: 24),
                Text("My name is Bram De Coninck and I'm currently studying Applied Computer Sciences " +
                    "at University College Ghent in Belgium. I've always loved creating mobile applications " +
                    "and I'm also very excited about BioWare's upcoming game Anthem. That's why I decided " +
                    "to create a companion app for it."),
                SizedBox(height: 12),
                Text("I'm currently the only programmer working on this companion app. The app is made with " +
                    "Google's Flutter framework. Currently there is no backend (server/database/...). I'm " +
                    "eagerly waiting for the Anthem developers to release an Anthem Api so I can implement " +
                    "some cool new features."),
                SizedBox(height: 12),
                Text("This app is a fan project and not affiliated with BioWare or EA. Certain materials from " +
                    "the Anthem Fan Art Kit were used. All rights in the Fansite Materials belong to Electronic " +
                    "ArtsInc. (“EA”), its affiliated companies or licensors."),
                SizedBox(height: 18),
                Text("Copyright © 2019 | Bram De Coninck")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
