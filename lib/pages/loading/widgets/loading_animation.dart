import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_playground/util/constantes.dart';

class LoadingAnimation extends StatefulWidget {
  final int duration;
  final String? label;
  final Color labelColor;
  const LoadingAnimation(this.duration,
      {this.label, this.labelColor = Colors.white, Key? key})
      : super(key: key);

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with TickerProviderStateMixin {
  AnimationController? bolinha1AnimationController;
  AnimationController? bolinha2AnimationController;
  AnimationController? bolinha3AnimationController;
  AnimationController? colorAnimationController;
  Animation<double>? animationBolinha1;
  Animation<double>? animationBolinha2;
  Animation<double>? animationBolinha3;
  Animation<Color?>? colorAnimation;

  @override
  void initState() {
    super.initState();
    Color randomColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    bolinha1AnimationController =
        createAnimController(Duration(milliseconds: widget.duration));
    bolinha2AnimationController =
        createAnimController(Duration(milliseconds: widget.duration));
    bolinha3AnimationController =
        createAnimController(Duration(milliseconds: widget.duration));

    colorAnimationController = createAnimController(Duration(seconds: 3));
    animationBolinha1 = createTweenDouble(bolinha1AnimationController!);
    animationBolinha2 = createTweenDouble(bolinha2AnimationController!);
    animationBolinha3 = createTweenDouble(bolinha3AnimationController!);

    colorAnimation = ColorTween(begin: Colors.white, end: randomColor)
        .animate(colorAnimationController!)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              colorAnimationController!.reverse();
            } else if (status == AnimationStatus.dismissed) {
              colorAnimationController!.forward();
            }
          });
    colorAnimationController!.forward();
    bolinha1AnimationController!.forward();
    Future.delayed(Duration(milliseconds: 200), () {
      if (mounted) {
        bolinha2AnimationController!.forward();
      }
    });
    Future.delayed(Duration(milliseconds: 400), () {
      if (mounted) {
        bolinha3AnimationController!.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(right: defaultPadding),
            child: Text(widget.label!,
                style: TextStyle(color: widget.labelColor, fontSize: 20)),
          ),
        ...bolinhas()
      ],
    );
  }

  @override
  void dispose() {
    bolinha1AnimationController!.dispose();
    bolinha2AnimationController!.dispose();
    bolinha3AnimationController!.dispose();
    colorAnimationController!.dispose();
    super.dispose();
  }

  List<Widget> bolinhas() {
    return [
      Transform.translate(
          child: Icon(
            Icons.circle,
            size: 15,
            color: colorAnimation!.value,
          ),
          offset: Offset(0, animationBolinha1!.value)),
      Transform.translate(
          child: Icon(
            Icons.circle,
            size: 15,
            color: colorAnimation!.value,
          ),
          offset: Offset(0, animationBolinha2!.value)),
      Transform.translate(
          child: Icon(
            Icons.circle,
            size: 15,
            color: colorAnimation!.value,
          ),
          offset: Offset(0, animationBolinha3!.value)),
    ];
  }

  Animation<double> createTweenDouble(AnimationController animationController) {
    return Tween<double>(begin: 0, end: -20).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
  }

  AnimationController createAnimController(Duration duration) {
    return new AnimationController(duration: duration, vsync: this);
  }
}
