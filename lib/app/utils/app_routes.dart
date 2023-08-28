import 'package:flutter/material.dart';
import 'package:mvvm_demo_persatation_1/presentation/ui/dashboard/dashboard.dart';

import '../../presentation/ui/splash/splash.dart';
/// Created by Appinventiv  on [18-Aug-2023].
class Routes {
  static const splash = "splash";
  static const login = "login";
  static const register = "register";
  static const dashboard = "dashboard";
}

class AppRouteSetting {
  String currentPage = "";

  /// Generate Route
  Route<dynamic> Function(RouteSettings) onGenerateRoute(
          {Widget? tabItem, Key? key}) =>
      (settings) {
        dynamic target;
        dynamic argument = settings.arguments;
        switch (settings.name) {
          case Routes.splash:
            target = const Splash();
            break;
          case Routes.dashboard:
            target = const Dashboard();
            break;
          default:
            target = tabItem;
        }
        return MaterialPageRoute(
          builder: (context) => target,
        );
      };
}
