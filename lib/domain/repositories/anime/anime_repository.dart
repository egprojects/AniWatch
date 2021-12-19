import '/domain/models/anime/anime_details.dart';
import '/domain/models/anime/anime_preview.dart';

export '/domain/models/anime/anime_details.dart';
export '/domain/models/anime/anime_preview.dart';

abstract class AnimeRepository {
  Future<List<AnimePreview>> getLatestReleases(int limit);

  Future<AnimeDetails> getAnimeDetails(int id);
}
