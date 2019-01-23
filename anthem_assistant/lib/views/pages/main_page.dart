import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:anthem_assistant/views/pages/inventory_page.dart';
import 'package:anthem_assistant/views/pages/lfg_page.dart';
import 'package:anthem_assistant/views/pages/map_page.dart';
import 'package:anthem_assistant/views/pages/news_page.dart';
import 'package:anthem_assistant/views/pages/profile_page.dart';
import 'package:anthem_assistant/views/pages/settings_page.dart';
import 'package:anthem_assistant/views/pages/social_page.dart';
import 'package:anthem_assistant/views/widgets/main_page/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _currentIndex = 4;
  final List<Widget> children = [
    LFGPage(),
    SocialPage(),
    InventoryPage(),
    MapPage(),
    NewsPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  void _selectedTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _selectFab() {
    setState(() {
      FABBottomAppBarState.selectedIndex = -1;
      _currentIndex = 4;
    });
  }

  void _selectMenuItem(String menuItem) {
    setState(() {
      FABBottomAppBarState.selectedIndex = -2;
      switch (menuItem) {
        case 'Profile':
          _currentIndex = 5;
          break;
        case 'Settings':
          _currentIndex = 6;
          break;
        default:
          _currentIndex = 4;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? ColorConstants.primaryColorDark
            : ColorConstants.accentColor,
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
        child: children[_currentIndex],
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
        backgroundColor: ColorConstants.accentColor,
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
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
