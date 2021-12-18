import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/services/navigation/navigation_service.dart';
import '/domain/services/navigation/tab_navigation_service.dart';
import '/presentation/anime_details/anime_details_view.dart';
import '/presentation/anime_details/anime_details_view_model.dart';
import '/presentation/bookmarks/bookmarks_view.dart';
import '/presentation/downloads/downloads_view.dart';
import '/presentation/home/home_view.dart';
import '/presentation/home/home_view_model.dart';
import '/presentation/profile/profile_view.dart';
import '/presentation/search/search_view.dart';
import 'app_navigation_service.dart';

class AppTabNavigationService extends AppNavigationService
    implements TabNavigationService {
  const AppTabNavigationService({
    required NavigatorKey navigatorKey,
  }) : super(navigatorKey: navigatorKey);

  static const String _animeRouteName = r'/anime';
  static const String _bookmarksRouteName = r'/bookmarks';
  static const String _downloadsRouteName = r'/downloads';
  static const String _homeRouteName = r'/';
  static const String _profileRouteName = r'/profile';
  static const String _searchRouteName = r'/search';

  @override
  String animeRouteName(String id) => '$_animeRouteName/$id';

  @override
  String get bookmarksRouteName => _bookmarksRouteName;

  @override
  String get downloadsRouteName => _downloadsRouteName;

  @override
  String get homeRouteName => _homeRouteName;

  @override
  String get profileRouteName => _profileRouteName;

  @override
  String get searchRouteName => _searchRouteName;

  @override
  Future<dynamic> openAnimeDetails(int id) {
    return navigator.pushNamed('$_animeRouteName/$id');
  }

  @override
  Future<dynamic> openBookmarks() {
    return navigator.pushNamed(_bookmarksRouteName);
  }

  @override
  Future<dynamic> openDownloads() {
    return navigator.pushNamed(_downloadsRouteName);
  }

  @override
  Future<dynamic> openHome() {
    return navigator.pushNamed(_homeRouteName);
  }

  @override
  Future<dynamic> openProfile() {
    return navigator.pushNamed(_profileRouteName);
  }

  @override
  Future<dynamic> openSearch() {
    return navigator.pushNamed(_searchRouteName);
  }

  @override
  RouteBuilder<Widget>? findRouteBuilder(String? routeName) {
    if (routeName == null) {
      return null;
    } else if (routeName == _bookmarksRouteName) {
      return _bookmarksRouteBuilder;
    } else if (routeName == _downloadsRouteName) {
      return _downloadsRouteBuilder;
    } else if (routeName == _homeRouteName) {
      return _homeRouteBuilder;
    } else if (routeName == _profileRouteName) {
      return _profileRouteBuilder;
    } else if (routeName == _searchRouteName) {
      return _searchRouteBuilder;
    } else if (routeName.startsWith(_animeRouteName)) {
      return _animeDetailsRouteBuilder;
    } else {
      return null;
    }
  }

  Widget _animeDetailsRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider<AnimeDetailsViewModel>(
      create: (BuildContext context) {
        final String routeName = settings.name!;
        final String idSourceString = routeName.substring(
          _animeRouteName.length + 1,
        );
        final int id = int.parse(idSourceString);

        return AnimeDetailsViewModel(
          id: id,
          animeRepository: context.read(),
          rootNavigationService: context.read(),
        );
      },
      child: const AnimeDetailsView(),
    );
  }

  Widget _bookmarksRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return const BookmarksView();
  }

  Widget _downloadsRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return const DownloadsView();
  }

  Widget _homeRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        animeRepository: context.read(),
        tabNavigationService: context.read(),
      ),
      child: const HomeView(),
    );
  }

  Widget _profileRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return const ProfileView();
  }

  Widget _searchRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return const SearchView();
  }
}
