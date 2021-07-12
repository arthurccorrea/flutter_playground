import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String texto;
  final Color backgroundColor;
  final Color textColor;
  final Key? key;
  final Function()? onPressed;
  final double? minWidth;
  final double? fontSize;
  final bool shadowOff;

  DefaultButton(this.texto, this.backgroundColor, this.textColor,
      {this.onPressed,
      this.minWidth,
      this.fontSize,
      this.key,
      this.shadowOff = false});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? autoGeralCupertinoButton(texto, backgroundColor, textColor, context,
            onPressed: onPressed, minWidth: minWidth)
        : autoGeralButton(texto, backgroundColor, textColor, context,
            onPressed: onPressed, minWidth: minWidth);
  }

  ElevatedButton autoGeralButton(String texto, Color backgroundColor,
      Color textColor, BuildContext context,
      {Function()? onPressed, double? minWidth}) {
    return ElevatedButton(
        key: key,
        child: Text(
          texto,
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: textColor, fontSize: fontSize),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shadowColor: shadowOff
              ? MaterialStateProperty.all<Color>(Colors.transparent)
              : MaterialStateProperty.all<Color>(Colors.black),
          minimumSize: MaterialStateProperty.all<Size>(
              minWidth != null ? Size(minWidth, 0) : Size.zero),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15.0)),
        ),
        onPressed: onPressed != null ? onPressed : () {});
  }

  CupertinoButton autoGeralCupertinoButton(String texto, Color backgroundColor,
      Color textColor, BuildContext context,
      {Function()? onPressed, double? minWidth}) {
    return CupertinoButton(
        child: Text(texto,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: textColor, fontSize: fontSize)),
        color: backgroundColor,
        onPressed: onPressed != null ? onPressed : () {});
  }
}
