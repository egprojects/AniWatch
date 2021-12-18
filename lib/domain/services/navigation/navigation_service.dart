import 'package:flutter/widgets.dart';

typedef NavigatorKey = GlobalKey<NavigatorState>;

typedef RouteBuilder<T extends Widget> = T Function(
  BuildContext context,
  RouteSettings settings,
);

abstract class NavigationService {
  const NavigationService({
    required NavigatorKey navigatorKey,
  }) : _navigatorKey = navigatorKey;

  final NavigatorKey _navigatorKey;

  NavigatorKey get navigatorKey => _navigatorKey;

  NavigatorState get navigator {
    final NavigatorState? navigator = _navigatorKey.currentState;

    if (navigator == null) {
      throw StateError('No navigator found');
    }

    return navigator;
  }

  List<Route<T>> onGenerateInitialRoutes<T>(
    NavigatorState navigator,
    String routeName,
  );

  Route<T>? onGenerateRoute<T>(RouteSettings settings) {
    final RouteBuilder? builder = findRouteBuilder(settings.name);

    return builder == null
        ? null
        : createRoute(
            settings: settings,
            builder: builder,
          );
  }

  Route<T> onUnknownRoute<T>(RouteSettings settings);

  RouteBuilder<Widget>? findRouteBuilder(String? routeName);

  Route<T> createRoute<T>({
    required RouteSettings settings,
    required RouteBuilder builder,
  });
}
