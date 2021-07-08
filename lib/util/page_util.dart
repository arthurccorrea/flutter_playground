import 'package:flutter/material.dart';

class PageUtil {
  /// Invoca o método push do [Navigator] para o Widget passado por parâmetro
  static navigate(Widget page, BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (BuildContext context) => page));
    });
  }

  /// Invoca o método pushReplacement do [Navigator] para o Widget passado por parâmetro
  static navigateReplacement(Widget page, BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (BuildContext context) => page));
    });
  }

  /// Invoca o método pushNamed do [Navigator] para o Widget passado por parâmetro
  static navigateToRoute(String route, BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.pushNamed(context, route);
    });
  }

  /// Invoca o método pushReplacementNamed do [Navigator] para o Widget passado por parâmetro
  static navigateToRouteReplacement(String route, BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, route);
    });
  }

  /// Faz fechar todos os contextos até chegar a primeira rota, que é a [HomePage]
  static popToHome(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }
}
