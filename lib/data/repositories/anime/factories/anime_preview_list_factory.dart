import '/data/models/anime_preview_data.dart';
import '/domain/models/anime/anime_preview.dart';

class AnimePreviewListFactory {
  const AnimePreviewListFactory({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final String _baseUrl;

  List<AnimePreview> fromDataList(List<AnimePreviewData> dataList) {
    return dataList.map((data) {
      return AnimePreview(
        id: data.id,
        titleRu: data.titleRu,
        titleEn: data.titleEn,
        posterUrl: '$_baseUrl${data.posterPath}',
        score: data.score,
      );
    }).toList(growable: false);
  }
}
