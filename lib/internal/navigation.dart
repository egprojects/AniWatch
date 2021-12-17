import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialPageRoute,
        Navigator,
        Route,
        RouteSettings,
        Widget;
import 'package:provider/provider.dart';

import '/presentation/anime_details/anime_details_view.dart';
import '/presentation/anime_details/anime_details_view_model.dart';
import '/presentation/bookmarks/bookmarks_view.dart';
import '/presentation/downloads/downloads_view.dart';
import '/presentation/home/home_view.dart';
import '/presentation/home/home_view_model.dart';
import '/presentation/profile/profile_view.dart';
import '/presentation/search/search_view.dart';
import '/presentation/unknown_page/unknown_page_view.dart';

typedef _RouteBuilder = Widget Function(
  BuildContext context,
  RouteSettings settings,
);

const String bookmarksRouteName = r'/bookmarks';
const String downloadsRouteName = r'/downloads';
const String homeRouteName = r'/';
const String profileRouteName = r'/profile';
const String searchRouteName = r'/search';
const String animeRouteName = r'/anime';

Future<dynamic> openHome(BuildContext context) {
  return Navigator.pushNamed(context, homeRouteName);
}

Future<dynamic> openAnimeDetails(
  BuildContext context, {
  required int id,
}) {
  return Navigator.pushNamed(context, '$animeRouteName/$id');
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final _RouteBuilder? builder = _findRouteBuilder(settings.name);

  return builder == null
      ? null
      : MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => builder(context, settings),
        );
}

Route<dynamic> onUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute<UnknownPageView>(
    builder: (context) {
      return const UnknownPageView();
    },
  );
}

_RouteBuilder? _findRouteBuilder(String? routeName) {
  if (routeName == null) {
    return null;
  } else if (routeName == bookmarksRouteName) {
    return _bookmarksRouteBuilder;
  } else if (routeName == downloadsRouteName) {
    return _downloadsRouteBuilder;
  } else if (routeName == homeRouteName) {
    return _homeRouteBuilder;
  } else if (routeName == profileRouteName) {
    return _profileRouteBuilder;
  } else if (routeName == searchRouteName) {
    return _searchRouteBuilder;
  } else if (routeName.startsWith(animeRouteName)) {
    return _animeDetailsRouteBuilder;
  } else {
    return null;
  }
}

Widget _bookmarksRouteBuilder(BuildContext context, RouteSettings settings) {
  return const BookmarksView();
}

Widget _downloadsRouteBuilder(BuildContext context, RouteSettings settings) {
  return const DownloadsView();
}

Widget _homeRouteBuilder(BuildContext context, RouteSettings settings) {
  return ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(
      animeRepository: context.read(),
    ),
    child: const HomeView(),
  );
}

Widget _profileRouteBuilder(BuildContext context, RouteSettings settings) {
  return const ProfileView();
}

Widget _searchRouteBuilder(BuildContext context, RouteSettings settings) {
  return const SearchView();
}

Widget _animeDetailsRouteBuilder(BuildContext context, RouteSettings settings) {
  return ChangeNotifierProvider<AnimeDetailsViewModel>(
    create: (BuildContext context) {
      final String routeName = settings.name!;
      final String idSourceString =
          routeName.substring(animeRouteName.length + 1);
      final int id = int.parse(idSourceString);

      return AnimeDetailsViewModel(
        id: id,
        animeRepository: context.read(),
      );
    },
    child: const AnimeDetailsView(),
  );
}
