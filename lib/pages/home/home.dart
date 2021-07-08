import 'package:flutter/material.dart';
import 'package:flutter_playground/page_builder.dart';
import 'package:flutter_playground/pages/home/widgets/home_card.dart';
import 'package:flutter_playground/pages/loading/loading.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PageBuilder> pages = [
    //Loading
    PageBuilder(
        title: "Loading",
        color: Colors.purple,
        titleColor: Colors.white,
        page: LoadingPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6),
          itemCount: pages.length,
          itemBuilder: (context, index) => HomeCard(pageBuilder: pages[index])),
    );
  }
}
