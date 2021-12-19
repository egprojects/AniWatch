import 'package:flutter/material.dart' show MaterialPageRoute;
import 'package:flutter/widgets.dart'
    show BuildContext, NavigatorState, Route, RouteSettings, Widget;

import '/presentation/unknown_page/unknown_page_view.dart';
import 'app_navigation_service.dart';
import 'app_navigation_service_error.dart';
import 'navigator_key.dart';
import 'route_builder.dart';

export 'navigator_key.dart';

abstract class AppNavigationServiceBase extends AppNavigationService {
  const AppNavigationServiceBase({
    required NavigatorKey navigatorKey,
    required Map<RegExp, RouteBuilder> routeBuilders,
  })  : _navigatorKey = navigatorKey,
        _routeBuilders = routeBuilders;

  final NavigatorKey _navigatorKey;
  final Map<RegExp, RouteBuilder> _routeBuilders;

  @override
  NavigatorKey get navigatorKey => _navigatorKey;

  NavigatorState get _navigator {
    final NavigatorState? navigator = _navigatorKey.currentState;

    if (navigator == null) {
      throw StateError('No navigator found');
    }

    return navigator;
  }

  @override
  List<Route<T>> onGenerateInitialRoutes<T>(
    NavigatorState navigator,
    String routeName,
  ) {
    final RouteSettings routeSettings = RouteSettings(name: routeName);
    final Route<T>? route = onGenerateRoute(routeSettings);

    return [
      if (route != null) route,
    ];
  }

  @override
  Route<T>? onGenerateRoute<T>(RouteSettings settings) {
    final RouteBuilder? builder = _findRouteBuilder(settings.name);

    return builder == null
        ? null
        : createRoute(
            settings: settings,
            builder: builder,
          );
  }

  @override
  Route<T> onUnknownRoute<T>(RouteSettings settings) {
    return createRoute(
      settings: settings,
      builder: _unknownPageRouteBuilder,
    );
  }

  RouteBuilder<Widget>? _findRouteBuilder(String? routeName) {
    if (routeName == null) {
      return null;
    }

    for (final entry in _routeBuilders.entries) {
      if (entry.key.hasMatch(routeName)) {
        return entry.value;
      }
    }

    return _routeBuilders.entries
        .cast<MapEntry<RegExp, RouteBuilder>?>()
        .singleWhere(
          (entry) => entry!.key.hasMatch(routeName),
          orElse: () => null,
        )
        ?.value;
  }

  Route<T> createRoute<T>({
    required RouteSettings settings,
    required RouteBuilder builder,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder(context, settings),
    );
  }

  @override
  Future<T?> push<T extends Object?>({
    required String routeName,
    required RegExp verificator,
    Object? arguments,
  }) {
    if (!verificator.hasMatch(routeName)) {
      throw AppNavigationServiceError(routeName);
    }

    return _navigator.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Widget _unknownPageRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return const UnknownPageView();
  }
}
