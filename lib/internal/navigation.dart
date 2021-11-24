import 'package:flutter/material.dart'
    show
        BuildContext,
        MaterialPageRoute,
        Navigator,
        Route,
        RouteSettings,
        Widget;
import 'package:provider/provider.dart';

import '/presentation/anime_details/anime_details_model.dart';
import '/presentation/anime_details/anime_details_page.dart';
import '/presentation/home/home_model.dart';
import '/presentation/home/home_page.dart';

typedef _RouteBuilder = Widget Function(
  BuildContext context,
  RouteSettings settings,
);

const _homeRouteName = r'/';
const _animeRouteName = r'/anime';

Future<dynamic> openHome(BuildContext context) {
  return Navigator.pushNamed(context, _homeRouteName);
}

Future<dynamic> openAnimeDetails(
  BuildContext context, {
  required int id,
}) {
  return Navigator.pushNamed(context, '$_animeRouteName/$id');
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final String? routeName = settings.name;
  late final _RouteBuilder builder;

  if (routeName == null) {
    return null;
  } else if (routeName == _homeRouteName) {
    builder = _homeRouteBuilder;
  } else if (routeName.startsWith(_animeRouteName)) {
    builder = _animeDetailsRouteBuilder;
  }

  return MaterialPageRoute(
    settings: settings,
    builder: (context) => builder(context, settings),
  );
}

Widget _homeRouteBuilder(BuildContext context, RouteSettings settings) {
  return ChangeNotifierProvider<HomeModel>(
    create: (context) => HomeModel(
      animeRepository: context.read(),
    ),
    child: const HomePage(),
  );
}

Widget _animeDetailsRouteBuilder(BuildContext context, RouteSettings settings) {
  return ChangeNotifierProvider<AnimeDetailsModel>(
    create: (context) {
      final String routeName = settings.name!;
      final String idSourceString =
          routeName.substring(_animeRouteName.length + 1);
      final int id = int.parse(idSourceString);

      return AnimeDetailsModel(
        id: id,
        animeRepository: context.read(),
      );
    },
    child: const AnimeDetailsPage(),
  );
}
