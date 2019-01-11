import 'package:anthem_assistant/widgets/CustomBottomNavigationBar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthem Assistant',
      theme: ThemeData(primaryColor: Color(0xFFed3e4d)),
      home: MyHomePage(title: 'Anthem Assistant'),
      debugShowCheckedModeBanner: false,
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {},
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
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset('assets/logo_anthem_assistant_white.png'),
        ),
        elevation: 2.0,
        backgroundColor: Color(0xFFed3e4d),
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        centerItemText: 'News',
        items: [
          FABBottomAppBarItem(iconData: Icons.youtube_searched_for, text: 'LFG'),
          FABBottomAppBarItem(iconData: Icons.group, text: 'Social'),
          FABBottomAppBarItem(iconData: Icons.table_chart, text: 'Inventory'),
          FABBottomAppBarItem(iconData: Icons.map, text: 'Map'),
        ],
      ),
    );
  }

  void choiceAction(String choice) {}
}
