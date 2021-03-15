import 'package:flutter/material.dart';
import 'package:flutter_intermediate/pages/home_page.dart';
import 'package:flutter_intermediate/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
      routes: {
        IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
