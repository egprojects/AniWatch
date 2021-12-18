import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/services/navigation/navigation_service.dart';
import '/domain/services/navigation/root_navigation_service.dart';
import '/presentation/navigation/navigation_view.dart';
import '/presentation/navigation/navigation_view_model.dart';
import '/presentation/player/player_view.dart';
import '/presentation/player/player_view_model.dart';
import 'app_navigation_service.dart';

class AppRootNavigationService extends AppNavigationService
    implements RootNavigationService {
  const AppRootNavigationService({
    required NavigatorKey navigatorKey,
  }) : super(navigatorKey: navigatorKey);

  static const String _navigationRouteName = r'/';
  static const String _playerRouteName = r'/play';

  @override
  Future<dynamic> openNavigation() {
    return navigator.pushNamed(_navigationRouteName);
  }

  @override
  Future openPlayer() {
    return navigator.pushNamed(_playerRouteName);
  }

  @override
  RouteBuilder<Widget>? findRouteBuilder(String? routeName) {
    if (routeName == null) {
      return null;
    } else if (routeName == _navigationRouteName) {
      return _navigationRouteBuilder;
    } else if (routeName == _playerRouteName) {
      return _playerRouteBuilder;
    } else {
      return null;
    }
  }

  Widget _navigationRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider(
      create: (context) => NavigationViewModel(),
      child: const NavigationView(),
    );
  }

  Widget _playerRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider(
      create: (context) => PlayerViewModel(),
      child: const PlayerView(),
    );
  }
}
