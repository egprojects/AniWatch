import '/data/models/models.dart';

export '/data/models/models.dart';

abstract class AnimeSource {
  const AnimeSource();

  Future<AnimeDetailsData> getAnimeDetails(int id);

  Future<List<AnimePreviewData>> getAnimePreviews({
    int? page,
    int? limit,
    SortBy? sortBy,
  });
}

enum SortBy {
  id,
  score,
  kind,
  popularity,
  name,
  releaseStartDate,
  episodesCount,
  status,
  random,
}
