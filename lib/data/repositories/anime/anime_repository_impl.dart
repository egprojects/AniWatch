import '/data/sources/anime/anime_remote_source.dart';
import '/data/sources/anime/anime_source.dart';
import '/domain/repositories/anime/anime_repository.dart';
import 'factories/factories.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl() : _remoteSource = AnimeRemoteSource();

  final AnimeSource _remoteSource;

  @override
  Future<AnimeDetails> getAnimeDetails(int id) {
    return _remoteSource.getAnimeDetails(id).then(AnimeDetailsFactory.fromData);
  }

  @override
  Future<List<AnimePreview>> getLatestReleases(int limit) {
    return _remoteSource
        .getAnimePreviews(
          limit: limit,
          sortBy: SortBy.score,
        )
        .then(AnimePreviewListFactory.fromDataList);
  }
}
