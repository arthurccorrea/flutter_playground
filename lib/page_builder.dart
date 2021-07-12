import 'package:flutter/material.dart';

class PageBuilder<T> {
  String title;
  Color color;
  Color titleColor;
  String pageRoute;

  PageBuilder(
      {required this.title,
      required this.color,
      required this.titleColor,
      required this.pageRoute});
}
