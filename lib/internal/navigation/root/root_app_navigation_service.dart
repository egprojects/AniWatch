import '../app_navigation_service_base.dart';
import '../route_builder.dart';

export '../app_navigation_service.dart';
export '../navigator_key.dart';

abstract class RootAppNavigationService extends AppNavigationServiceBase {
  const RootAppNavigationService({
    required NavigatorKey navigatorKey,
    required Map<RegExp, RouteBuilder> routeBuilders,
  }) : super(
          navigatorKey: navigatorKey,
          routeBuilders: routeBuilders,
        );

  Future<T?> openNavigation<T extends Object?>();

  Future<T?> openPlayer<T extends Object?>({
    required int id,
  });
}
