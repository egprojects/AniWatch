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
import '/presentation/navigation/navigation_view.dart';
import '/presentation/navigation/navigation_view_model.dart';

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
  return ChangeNotifierProvider<NavigationViewModel>(
    create: (context) => NavigationViewModel(
      initialTabIndex: NavigationViewModel.homeTabIndex,
    ),
    child: const NavigationView(),
  );
}

Widget _animeDetailsRouteBuilder(BuildContext context, RouteSettings settings) {
  return ChangeNotifierProvider<AnimeDetailsViewModel>(
    create: (BuildContext context) {
      final String routeName = settings.name!;
      final String idSourceString =
          routeName.substring(_animeRouteName.length + 1);
      final int id = int.parse(idSourceString);

      return AnimeDetailsViewModel(
        id: id,
        animeRepository: context.read(),
      );
    },
    child: const AnimeDetailsView(),
  );
}
