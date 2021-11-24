import '/data/api/models/models.dart';
import '/domain/models/anime/anime_details.dart';
import '/domain/models/anime/anime_preview.dart';

export '/data/api/models/models.dart';
export '/domain/models/anime/anime_details.dart';
export '/domain/models/anime/anime_preview.dart';

abstract class ApiService {
  const ApiService();

  Future<List<AnimePreview>> getAnimePreviews({
    int? page,
    int? limit,
    Order? order,
  });

  Future<AnimeDetails> getAnimeDetails(int id);
}
