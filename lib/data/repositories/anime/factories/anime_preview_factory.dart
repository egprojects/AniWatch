import '/data/models/anime_preview_data.dart';
import '/domain/models/anime/anime_preview.dart';

class AnimePreviewFactory {
  const AnimePreviewFactory._();

  static AnimePreview fromData(AnimePreviewData data) {
    return AnimePreview(
      id: data.id,
      titleRu: data.titleRu,
      titleEn: data.titleEn,
      posterUrl: data.posterPath,
      score: data.score,
    );
  }
}
