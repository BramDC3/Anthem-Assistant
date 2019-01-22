import 'package:anthem_assistant/views/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthem Assistant',
      theme: ThemeData(primaryColor: Color(0xFFed3e4d)),
      home: MainPage(title: 'Anthem Assistant'),
      debugShowCheckedModeBanner: false,
    );
  }
}
