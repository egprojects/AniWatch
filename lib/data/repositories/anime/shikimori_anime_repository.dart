import '/data/sources/anime/shikimori_anime_source.dart';
import '/domain/repositories/anime/anime_repository.dart';
import 'factories/factories.dart';

export '/domain/repositories/anime/anime_repository.dart';

class ShikimoriAnimeRepository implements AnimeRepository {
  ShikimoriAnimeRepository()
      : _remoteSource = ShikimoriAnimeSource(),
        _animeDetailsFactory =
            const AnimeDetailsFactory(baseUrl: 'https://shikimori.one'),
        _animePreviewListFactory =
            const AnimePreviewListFactory(baseUrl: 'https://shikimori.one');

  final AnimeSource _remoteSource;
  final AnimeDetailsFactory _animeDetailsFactory;
  final AnimePreviewListFactory _animePreviewListFactory;

  @override
  Future<AnimeDetails> getAnimeDetails(int id) {
    return _remoteSource
        .getAnimeDetails(id)
        .then(_animeDetailsFactory.fromData);
  }

  @override
  Future<List<AnimePreview>> getLatestReleases(int limit) {
    return _remoteSource
        .getAnimePreviews(
          limit: limit,
          sortBy: SortBy.score,
        )
        .then(_animePreviewListFactory.fromDataList);
  }
}
