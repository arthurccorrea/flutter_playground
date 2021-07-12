import 'package:flutter/material.dart';
import 'package:flutter_playground/page_builder.dart';
import 'package:flutter_playground/util/page_util.dart';

class HomeCard extends StatelessWidget {
  final PageBuilder pageBuilder;
  const HomeCard({required this.pageBuilder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => PageUtil.navigateToRoute(pageBuilder.pageRoute, context),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              color: pageBuilder.color,
            ),
            child: Center(
              child: Text(pageBuilder.title,
                  style:
                      TextStyle(color: pageBuilder.titleColor, fontSize: 25)),
            ),
          )),
    );
  }
}
