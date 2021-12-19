import 'package:flutter/widgets.dart' show BuildContext, RouteSettings, Widget;
import 'package:provider/provider.dart';

import '/presentation/anime_details/anime_details_view.dart';
import '/presentation/anime_details/anime_details_view_model.dart';
import '/presentation/home/home_view.dart';
import '/presentation/home/home_view_model.dart';
import '../route_builder.dart';
import 'tab_app_navigation_service.dart';

class TabAppNavigationServiceImpl extends TabAppNavigationService {
  TabAppNavigationServiceImpl({
    required NavigatorKey navigatorKey,
  }) : super(
          navigatorKey: navigatorKey,
          routeBuilders: routeBuilders,
        );

  static final RegExp _animeDetailsRouteNameVerifier = RegExp(r'^/anime/\d+$');
  static final RegExp _homeRouteNameVerifier = RegExp(r'^/$');

  static final Map<RegExp, RouteBuilder> routeBuilders = {
    _animeDetailsRouteNameVerifier: _animeDetailsRouteBuilder,
    _homeRouteNameVerifier: _homeRouteBuilder,
  };

  @override
  String animeDetailsRouteName(int id) => '/anime/$id';

  @override
  String get bookmarksRouteName => r'/bookmarks';

  @override
  String get downloadsRouteName => r'/downloads';

  @override
  String get homeRouteName => r'/';

  @override
  String get profileRouteName => r'/profile';

  @override
  String get searchRouteName => r'/search';

  @override
  Future<T?> openAnimeDetails<T extends Object?>(int id) {
    return push(
      routeName: animeDetailsRouteName(id),
      verificator: _animeDetailsRouteNameVerifier,
    );
  }

  @override
  Future<T?> openBookmarks<T extends Object?>() {
    return openHome();
  }

  @override
  Future<T?> openDownloads<T extends Object?>() {
    return openHome();
  }

  @override
  Future<T?> openHome<T extends Object?>() {
    return push(
      routeName: homeRouteName,
      verificator: _homeRouteNameVerifier,
    );
  }

  @override
  Future<T?> openProfile<T extends Object?>() {
    return openHome();
  }

  @override
  Future<T?> openSearch<T extends Object?>() {
    return openHome();
  }

  static Widget _animeDetailsRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider<AnimeDetailsViewModel>(
      create: (BuildContext context) {
        // final String routeName = settings.name!;
        // final String idSourceString =
        //     routeName.substring(animeRouteName.length + 1);
        // final int id = int.parse(idSourceString);
        final int id = 1;

        return AnimeDetailsViewModel(
          id: id,
          animeService: context.read(),
          rootNavigationService: context.read(),
        );
      },
      child: const AnimeDetailsView(),
    );
  }

  static Widget _homeRouteBuilder(
    BuildContext context,
    RouteSettings settings,
  ) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        animeService: context.read(),
        tabNavigationService: context.read(),
      ),
      child: const HomeView(),
    );
  }
}
