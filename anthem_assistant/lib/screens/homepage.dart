import 'package:anthem_assistant/utils/twitter_utils/twitter.dart';
import 'package:anthem_assistant/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectFab() {
    Twitter.getTweetsFromUser("anthemgame");
    setState(() {
      FABBottomAppBarState.selectedIndex = -1;
      _lastSelected = 'TAB: FAB';
    });
  }

  void _selectMenuItem(String menuItem) {
    setState(() {
      FABBottomAppBarState.selectedIndex = -1;
      _lastSelected = 'TAB: $menuItem';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _selectMenuItem,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                PopupMenuItem(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _selectFab();
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset('assets/logo_anthem_assistant_white.png'),
        ),
        elevation: 2.0,
        backgroundColor: Color(0xFFed3e4d),
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Color(0xFFed3e4d),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        centerItemText: 'News',
        items: [
          FABBottomAppBarItem(
              iconData: Icons.youtube_searched_for, text: 'LFG'),
          FABBottomAppBarItem(iconData: Icons.group, text: 'Social'),
          FABBottomAppBarItem(iconData: Icons.table_chart, text: 'Inventory'),
          FABBottomAppBarItem(iconData: Icons.map, text: 'Map'),
        ],
      ),
    );
  }

}
