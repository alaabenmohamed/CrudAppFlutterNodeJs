import 'package:flutter/material.dart';
import 'package:front/pages/AddProduitPage.dart';
import 'package:front/pages/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ProductListScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/add': (context) => AddPage(),
      },
    );
  }
}
