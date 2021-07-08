import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/home/home.dart';

void main() {
  runApp(FlutterPlaygoundApp());
}

class FlutterPlaygoundApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
