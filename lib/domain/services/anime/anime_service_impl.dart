import '/domain/repositories/anime/anime_repository.dart';
import 'anime_service.dart';

export 'anime_service.dart';

class AnimeServiceImpl extends AnimeService {
  const AnimeServiceImpl({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<AnimeDetails> getAnimeDetails(int id) {
    return _repository.getAnimeDetails(id);
  }

  @override
  Future<List<AnimePreview>> getLatestReleases(int limit) {
    return _repository.getLatestReleases(limit);
  }
}
