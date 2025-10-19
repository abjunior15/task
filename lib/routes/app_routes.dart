import 'package:task/features/landing/view/view.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../features/startup/view/splash_view.dart';

const String defaultRoute = '/';
const String homeRoute = '/Home-view';

final GlobalKey<NavigatorState> kAppNavigatorKey = GlobalKey<NavigatorState>();

class TwRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case defaultRoute:
        return _getPageRoute(
          viewToShow: const SplashView(),
          settings: settings,
        );

      case homeRoute:
        return _getPageRoute(
          viewToShow: const LandingView(),
          settings: settings,
        );

      default:
        return _getPageRoute(
          viewToShow: const SplashView(),
          settings: settings,
        );
    }
  }

  static PageRoute _getPageRoute({
    required Widget viewToShow,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialWithModalsPageRoute(
      builder: (_) => viewToShow,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
