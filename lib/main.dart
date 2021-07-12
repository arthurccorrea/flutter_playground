import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/home/home.dart';
import 'package:flutter_playground/pages/loading/loading_page.dart';

void main() {
  runApp(FlutterPlaygoundApp());
}

class FlutterPlaygoundApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFFb8339d), centerTitle: true)),
        home: Home(),
        initialRoute: '/',
        routes: {'/loading': (context) => LoadingPage()});
  }
}
