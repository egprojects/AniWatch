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
import '/presentation/home/home_view.dart';
import '/presentation/home/home_view_model.dart';

const String homeRouteName = r'/';
const String searchRouteName = r'/search';
const String bookmarksRouteName = r'/bookmarks';
const String downloadsRouteName = r'/downloads';
const String profileRouteName = r'/profile';
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
  final String? routeName = settings.name;
  late final Widget Function(BuildContext, RouteSettings) builder;

  if (routeName == null) {
    return null;
  } else if (routeName == homeRouteName) {
    builder = _homeRouteBuilder;
  } else if (routeName.startsWith(animeRouteName)) {
    builder = _animeDetailsRouteBuilder;
  }

  return MaterialPageRoute<dynamic>(
    settings: settings,
    builder: (BuildContext context) => builder(context, settings),
  );
}

Widget _homeRouteBuilder(BuildContext context, RouteSettings settings) {
  return ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(
      animeRepository: context.read(),
    ),
    child: const HomeView(),
  );
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
