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

const String _homeRouteName = r'/';
const String _animeRouteName = r'/anime';

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
  late final Widget Function(BuildContext, RouteSettings) builder;

  if (routeName == null) {
    return null;
  } else if (routeName == _homeRouteName) {
    builder = _homeRouteBuilder;
  } else if (routeName.startsWith(_animeRouteName)) {
    builder = _animeDetailsRouteBuilder;
  }

  return MaterialPageRoute<Widget>(
    settings: settings,
    builder: (BuildContext context) => builder(context, settings),
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
    create: (BuildContext context) {
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
