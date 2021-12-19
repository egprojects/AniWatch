import 'package:flutter/widgets.dart' show NavigatorState, Route, RouteSettings;

import 'navigator_key.dart';

export 'navigator_key.dart';

abstract class AppNavigationService {
  const AppNavigationService();

  NavigatorKey get navigatorKey;

  List<Route<T>> onGenerateInitialRoutes<T>(
    NavigatorState navigator,
    String routeName,
  );

  Route<T>? onGenerateRoute<T>(RouteSettings settings);

  Route<T> onUnknownRoute<T>(RouteSettings settings);

  Future<T?> push<T extends Object?>({
    required String routeName,
    required RegExp verificator,
    Object? arguments,
  });
}
