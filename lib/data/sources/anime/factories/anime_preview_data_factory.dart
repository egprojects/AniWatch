import '/data/models/anime_preview_data.dart';
import '/data/models/json.dart';

class AnimePreviewDataFactory {
  const AnimePreviewDataFactory._();

  static AnimePreviewData fromJson(Json json) {
    return AnimePreviewData(
      id: json['id'],
      titleRu: json['russian'],
      titleEn: json['name'],
      posterPath: json['image']['preview'],
      score: double.parse(json['score']),
    );
  }
}
