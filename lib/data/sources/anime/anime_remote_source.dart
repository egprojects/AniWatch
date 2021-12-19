import '../remote_source_base.dart';
import 'anime_source.dart';
import 'factories/factories.dart';

class AnimeRemoteSource extends RemoteSourceBase implements AnimeSource {
  AnimeRemoteSource() : super('shikimori.one');

  @override
  Future<AnimeDetailsData> getAnimeDetails(int id) {
    return requestData(
      path: '/api/animes/$id',
      deserializer: AnimeDetailsDataFactory.fromJson,
    );
  }

  @override
  Future<List<AnimePreviewData>> getAnimePreviews({
    int? page,
    int? limit,
    SortBy? sortBy,
  }) {
    return requestDataList(
      path: '/api/animes',
      queryParameters: <String, String>{
        if (page != null) 'page': page.toString(),
        if (limit != null) 'limit': limit.toString(),
        if (sortBy != null) 'order': 'ranked',
      },
      deserializer: AnimePreviewDataFactory.fromJson,
    );
  }
}
