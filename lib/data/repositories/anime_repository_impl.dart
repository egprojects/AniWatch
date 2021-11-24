import '/data/api/service/api_service.dart';
import '/domain/repositories/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  const AnimeRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  @override
  Future<List<AnimePreview>> getLatestReleases(int limit) {
    return _apiService.getAnimePreviews(
      limit: limit,
      order: Order.ranked,
    );
  }

  @override
  Future<AnimeDetails> getAnimeDetails(int id) {
    return _apiService.getAnimeDetails(id);
  }
}
