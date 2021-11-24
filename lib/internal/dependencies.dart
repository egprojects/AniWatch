import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '/data/api/service/api_service.dart';
import '/data/api/service/shikimori_api_service.dart';
import '/data/repositories/anime_repository_impl.dart';
import '/domain/repositories/anime_repository.dart';

typedef DependencyCreator<T> = T Function(BuildContext);

ApiService _defaultApiServiceCreator(BuildContext context) => ShikimoriApiService();

AnimeRepository _defaultAnimeRepositoryCreator(BuildContext context) =>
    AnimeRepositoryImpl(
      apiService: context.read(),
    );

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({
    Key? key,
    this.apiServiceCreator = _defaultApiServiceCreator,
    this.animeRepositoryCreator = _defaultAnimeRepositoryCreator,
    this.child,
    this.builder,
  }) : super(key: key);

  final DependencyCreator<ApiService> apiServiceCreator;
  final DependencyCreator<AnimeRepository> animeRepositoryCreator;
  final Widget? child;
  final TransitionBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: apiServiceCreator),
        Provider<AnimeRepository>(create: animeRepositoryCreator),
      ],
      child: child,
      builder: builder,
    );
  }
}
