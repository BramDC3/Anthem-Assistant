import 'package:anthem_assistant/constants/colorconstants.dart';
import 'package:anthem_assistant/views/pages/main_page.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.red,
        primaryColor: ColorConstants.accentColor,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Anthem Assistant',
          theme: theme,
          home: MainPage(title: 'Anthem Assistant'),
      debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
