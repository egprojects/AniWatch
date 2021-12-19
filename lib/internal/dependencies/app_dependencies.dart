import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '/data/repositories/anime/shikimori_anime_repository.dart';
import '/domain/services/anime/anime_service_impl.dart';
import '../navigation/root/root_app_navigation_service_impl.dart';
import 'dependency_creator.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({
    required this.app,
    Key? key,
    this.rootAppNavigationServiceCreator =
        _DefaultAppDependencyCreators._rootAppNavigationServiceCreator,
    this.animeServiceCreator =
        _DefaultAppDependencyCreators._animeServiceCreator,
  }) : super(key: key);

  final DependencyCreator<RootAppNavigationService>
      rootAppNavigationServiceCreator;
  final DependencyCreator<AnimeService> animeServiceCreator;
  final Widget app;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RootAppNavigationService>(
          create: rootAppNavigationServiceCreator,
        ),
        Provider<AnimeService>(
          create: animeServiceCreator,
        ),
      ],
      child: app,
    );
  }
}

class _DefaultAppDependencyCreators {
  const _DefaultAppDependencyCreators._();

  static RootAppNavigationService _rootAppNavigationServiceCreator(
    BuildContext context,
  ) {
    return RootAppNavigationServiceImpl(
      navigatorKey: GlobalKey(),
    );
  }

  static AnimeService _animeServiceCreator(BuildContext context) {
    return AnimeServiceImpl(
      repository: ShikimoriAnimeRepository(),
    );
  }
}
