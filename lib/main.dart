import 'package:flutter/material.dart';
import 'package:simple_crud/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.pageName,
      routes: {
        HomePage.pageName: (_) => HomePage(),
        HomePage.pageName: (_) => HomePage(),
      },
    );
  }
}
