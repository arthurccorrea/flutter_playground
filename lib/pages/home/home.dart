import 'package:flutter/material.dart';
import 'package:flutter_playground/page_builder.dart';
import 'package:flutter_playground/pages/home/widgets/home_card.dart';
import 'package:flutter_playground/pages/loading/loading_page.dart';

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
        pageRoute: "/loading"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter playgound"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6),
            itemCount: pages.length,
            itemBuilder: (context, index) =>
                HomeCard(pageBuilder: pages[index])),
      ),
    );
  }
}
