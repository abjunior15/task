import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  /// Pushes a new route onto the navigator.
  Future<T?> push<T>(Route<T> route) => Navigator.push(this, route);

  /// Pop the current route off the navigator.
  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);

  /// Push a named route onto the navigator
  ///
  /// `kAppNavigatorKey.currentState?.pushNamed('/routeName')` as
  /// `context.pushNamed('/routeName')
  ///
  /// [routeName] is the name of the route to push.
  /// [arguments] is the arguments to pass to the route.
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed<T?>(
        this,
        routeName,
        arguments: arguments,
      );

  Future<T?> pushNamedAndRemoveUntil<T>(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil<T?>(
        this,
        newRouteName,
        predicate,
        arguments: arguments,
      );

  /// Whether the navigator can be popped.
  ///
  /// `Navigator.canPop(context)` as `context.canPop()`
  bool canPop() => Navigator.canPop(this);

  /// Pop the routs until the predicate is true.
  ///
  /// `Navigator.popUntil(context, (route) => route.isFirst)` as
  /// `context.popUntil((route) => route.isFirst)`
  void popUntil(RoutePredicate predicate) =>
      Navigator.popUntil(this, predicate);
}

extension ThemeExtension on BuildContext {
  /// Get the theme of the current context.
  ///
  /// `Theme.of(context)` as `context.theme`
  ThemeData get theme => Theme.of(this);

  /// Get the text theme of the current context.
  ///
  /// `Theme.of(context).textTheme` as `context.textTheme`
  TextTheme get textTheme => theme.textTheme;

  /// Get the color scheme of the current context.
  ///
  /// `Theme.of(context).colorScheme` as `context.colorScheme`
  ColorScheme get colorScheme => theme.colorScheme;
}

extension MediaQueryExtension on BuildContext {
  /// Get the media query of the current context.
  ///
  /// `MediaQuery.of(context)` as `context.mediaQuery`
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the height of the current device.
  ///
  /// `MediaQuery.of(context).size.height` as `context.height`
  double get screenHeight => mediaQuery.size.height;

  /// Get the width of the current device.
  ///
  /// `MediaQuery.of(context).size.width` as `context.width`
  double get screenWidth => mediaQuery.size.width;
}

OverlayEntry? currentOverlayEntry;
OverlayEntry? overlay = OverlayEntry(
  builder: (context) => const ColoredBox(
    color: Color(0x80ffffff),
    child: Center(
      child: Center(
        child: Text(
          'Loading...',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ),
  ),
);

OverlayEntry? createOverlay(Widget widget) {
  return OverlayEntry(
    builder: (context) => widget,
  );
}

extension OverlayExtension on BuildContext {
  /// Insert an overlay entry into the overlay.
  void startLoading() {
    if (currentOverlayEntry == null) {
      currentOverlayEntry = overlay;
      Overlay.of(this).insert(currentOverlayEntry!);
    }
  }

  /// Remove an overlay entry from the overlay.
  void removeLoading() {
    if (currentOverlayEntry != null && currentOverlayEntry!.mounted) {
      currentOverlayEntry!.remove();
      currentOverlayEntry = null;
    }
  }

  /// Insert an overlay entry into the overlay.
  void startLoadingWidget(Widget widget) {
    if (currentOverlayEntry == null) {
      currentOverlayEntry = createOverlay(widget);
      Overlay.of(this).insert(currentOverlayEntry!);
    }
  }

  /// Remove an overlay entry from the overlay.
  void removeLoadingWidget() {
    if (currentOverlayEntry != null && currentOverlayEntry!.mounted) {
      currentOverlayEntry!.remove();
      currentOverlayEntry = null;
    }
  }
}
