import 'package:flutter/material.dart';

class PageBuilder {
  String title;
  Color color;
  Color titleColor;
  Widget page;

  PageBuilder(
      {required this.title,
      required this.color,
      required this.titleColor,
      required this.page});
}
