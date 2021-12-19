import 'package:flutter/widgets.dart';

import '/internal/navigation/tab/tab_app_navigation_service.dart';

class NavigationTabViewModel {
  const NavigationTabViewModel({
    required this.initialRoute,
    required TabAppNavigationService tabNavigationService,
  }) : _tabNavigationService = tabNavigationService;

  final String initialRoute;
  final TabAppNavigationService _tabNavigationService;

  GlobalKey<NavigatorState> get navigatorKey =>
      _tabNavigationService.navigatorKey;

  List<Route<T>> onGenerateInitialRoutes<T>(
    NavigatorState navigator,
    String routeName,
  ) {
    return _tabNavigationService.onGenerateInitialRoutes(navigator, routeName);
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return _tabNavigationService.onGenerateRoute(settings);
  }

  Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return _tabNavigationService.onUnknownRoute(settings);
  }
}
