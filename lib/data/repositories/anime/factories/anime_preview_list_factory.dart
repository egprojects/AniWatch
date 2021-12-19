import '/data/models/anime_preview_data.dart';
import '/domain/models/anime/anime_preview.dart';
import 'anime_preview_factory.dart';

class AnimePreviewListFactory {
  const AnimePreviewListFactory._();

  static List<AnimePreview> fromDataList(List<AnimePreviewData> dataList) {
    return dataList.map(AnimePreviewFactory.fromData).toList(growable: false);
  }
}
