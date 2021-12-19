import '../app_navigation_service_base.dart';
import '../route_builder.dart';

export '../app_navigation_service.dart';
export '../navigator_key.dart';

abstract class TabAppNavigationService extends AppNavigationServiceBase {
  const TabAppNavigationService({
    required NavigatorKey navigatorKey,
    required Map<RegExp, RouteBuilder> routeBuilders,
  }) : super(
          navigatorKey: navigatorKey,
          routeBuilders: routeBuilders,
        );

  String animeDetailsRouteName(int id);

  String get bookmarksRouteName;

  String get downloadsRouteName;

  String get homeRouteName;

  String get profileRouteName;

  String get searchRouteName;

  Future<T?> openAnimeDetails<T extends Object?>(int id);

  Future<T?> openBookmarks<T extends Object?>();

  Future<T?> openDownloads<T extends Object?>();

  Future<T?> openHome<T extends Object?>();

  Future<T?> openProfile<T extends Object?>();

  Future<T?> openSearch<T extends Object?>();
}
