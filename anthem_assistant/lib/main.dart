import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:anthem_assistant/views/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthem Assistant',
      theme: ThemeData(primaryColor: ColorConstants.primaryColorRed),
      home: MainPage(title: 'Anthem Assistant'),
      debugShowCheckedModeBanner: false,
    );
  }
}
