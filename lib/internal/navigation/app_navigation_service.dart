import 'package:flutter/material.dart';

import '/domain/services/navigation/navigation_service.dart';
import '/presentation/unknown_page/unknown_page_view.dart';

abstract class AppNavigationService extends NavigationService {
  const AppNavigationService({
    required NavigatorKey navigatorKey,
  }) : super(navigatorKey: navigatorKey);

  @override
  List<Route<T>> onGenerateInitialRoutes<T>(
    NavigatorState navigator,
    String routeName,
  ) {
    final RouteSettings routeSettings = RouteSettings(name: routeName);
    final Route<T>? route = onGenerateRoute(routeSettings);

    if (route == null) {
      throw ArgumentError.value(
        routeName,
        'routeName',
        'Unknown route name',
      );
    }

    return [route];
  }

  @override
  Route<T> onUnknownRoute<T>(RouteSettings settings) {
    return createRoute(
      settings: settings,
      builder: _unknownPageRouteBuilder,
    );
  }

  @override
  Route<T> createRoute<T>({
    required RouteSettings settings,
    required RouteBuilder<Widget> builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder(context, settings),
    );
  }

  Widget _unknownPageRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return const UnknownPageView();
  }
}
