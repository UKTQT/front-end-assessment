import 'package:flutter/material.dart';

import '../../../feature/auth/splash/view/splash_view.dart';
import '../../../feature/home/home/view/home_view.dart';
import '../../constants/navigation/navigation_constant.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings path) {
    switch (path.name) {
      case NavigationConstant.DEFAULT:
        return normalNavigate(
            widget: const SplashView(), pageName: NavigationConstant.DEFAULT);
      case NavigationConstant.HOME:
        return normalNavigate(
            widget: const HomeView(), pageName: NavigationConstant.HOME);

      default:
        return normalNavigate(
            pageName: NavigationConstant.DEFAULT, widget: const SplashView());
    }
  }
}

MaterialPageRoute normalNavigate(
    {required Widget widget, required String pageName}) {
  return MaterialPageRoute(
    builder: (context) => widget,
    settings: RouteSettings(name: pageName),
  );
}

MaterialPageRoute argsNavigate(
    {required Widget widget,
    required String pageName,
    dynamic navigateArguments}) {
  return MaterialPageRoute(
    builder: (context) => widget,
    settings: RouteSettings(name: pageName, arguments: navigateArguments),
  );
}
