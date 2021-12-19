import 'package:flutter/widgets.dart' show BuildContext, RouteSettings, Widget;
import 'package:provider/provider.dart';

import '/presentation/navigation/navigation_view.dart';
import '/presentation/navigation/navigation_view_model.dart';
import '/presentation/player/player_view.dart';
import '/presentation/player/player_view_model.dart';
import 'root_app_navigation_service.dart';
import '../route_builder.dart';

class RootAppNavigationServiceImpl extends RootAppNavigationService {
  RootAppNavigationServiceImpl({
    required NavigatorKey navigatorKey,
  }) : super(
          navigatorKey: navigatorKey,
          routeBuilders: routeBuilders,
        );

  static final RegExp _navigationRouteNameVerifier = RegExp(r'^/$');
  static final RegExp _playerRouteNameVerifier = RegExp(r'^/anime/\d+/play$');

  static final Map<RegExp, RouteBuilder> routeBuilders = {
    _navigationRouteNameVerifier: _navigationRouteBuilder,
    _playerRouteNameVerifier: _playerRouteBuilder,
  };

  @override
  Future<T?> openNavigation<T extends Object?>() {
    return push(
      routeName: r'/',
      verificator: _navigationRouteNameVerifier,
    );
  }

  @override
  Future<T?> openPlayer<T extends Object?>({
    required int id,
  }) {
    return push(
      routeName: '/anime/$id/play',
      verificator: _playerRouteNameVerifier,
    );
  }

  static Widget _navigationRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider(
      create: (context) => NavigationViewModel(),
      child: const NavigationView(),
    );
  }

  static Widget _playerRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider(
      create: (context) => PlayerViewModel(),
      child: const PlayerView(),
    );
  }
}
