import 'package:flutter/material.dart';
import 'package:tell_me/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const HomeScreen(),
        'help': (BuildContext context) => HelpScreen(),
      },
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
    );
  }
}
