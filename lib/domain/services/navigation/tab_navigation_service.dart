import 'navigation_service.dart';

export 'navigation_service.dart';

abstract class TabNavigationService extends NavigationService {
  const TabNavigationService({
    required NavigatorKey navigatorKey,
  }) : super(navigatorKey: navigatorKey);

  String animeRouteName(String id);

  String get bookmarksRouteName;

  String get downloadsRouteName;

  String get homeRouteName;

  String get profileRouteName;

  String get searchRouteName;

  Future<dynamic> openAnimeDetails(int id);

  Future<dynamic> openBookmarks();

  Future<dynamic> openDownloads();

  Future<dynamic> openHome();

  Future<dynamic> openProfile();

  Future<dynamic> openSearch();
}
