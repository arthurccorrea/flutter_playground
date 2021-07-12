import 'package:flutter/material.dart';
import 'package:flutter_playground/core/default_button.dart';
import 'package:flutter_playground/core/gradient_container_body.dart';
import 'package:flutter_playground/pages/loading/widgets/loading_animation.dart';
import 'package:flutter_playground/util/constantes.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool loading = false;

  Future<void> fakeLoading() {
    return Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading"),
      ),
      body: GradientContainerBody(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: defaultSpacePadding),
              child: Text(
                "Click to load",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            if (!loading)
              DefaultButton(
                "Click me pls",
                Colors.pink,
                Colors.white,
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  fakeLoading();
                },
              )
            else
              LoadingAnimation(
                500,
                label: "Hey, it's loading something",
              )
          ],
        ),
      )),
    );
  }
}
