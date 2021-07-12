import 'package:flutter/material.dart';

class GradientContainerBody extends StatelessWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;

  GradientContainerBody(
      {required this.child,
      this.startColor = const Color(0xFFb8339d),
      this.endColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [startColor, endColor]),
        ),
        child: child);
  }
}
