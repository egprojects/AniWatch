import 'api_service.dart';
import 'restful_api_service_base.dart';

class _Endpoints {
  const _Endpoints._();

  static const String authority = 'shikimori.one';

  static const String api = '/api';
  static const String animes = '$api/animes';
  static String anime(int id) => '$animes/$id';
}

class ShikimoriApiService extends RestfulApiServiceBase implements ApiService {
  ShikimoriApiService() : super(_Endpoints.authority);

  @override
  Future<List<AnimePreview>> getAnimePreviews({
    int? page,
    int? limit,
    Order? order,
  }) {
    return requestDataList(
      path: _Endpoints.animes,
      queryParameters: <String, String>{
        if (page != null) 'page': page.toString(),
        if (limit != null) 'limit': limit.toString(),
        if (order != null) 'order': order.toString(),
      },
      deserializer: _deserializeAnimePreview,
    );
  }

  @override
  Future<AnimeDetails> getAnimeDetails(int id) {
    return requestData(
      path: _Endpoints.anime(id),
      deserializer: _deserializeAnimeDetails,
    );
  }

  AnimePreview _deserializeAnimePreview(Json json) {
    return AnimePreview(
      id: json['id'],
      title: json['russian'],
      posterUrl: _deserializePreviewPosterUrl(json['image']),
      score: _deserializeDouble(json['score']),
    );
  }

  AnimeDetails _deserializeAnimeDetails(Json json) {
    return AnimeDetails(
      id: json['id'],
      title: json['russian'],
      posterUrl: _deserializeOriginalPosterUrl(json['image']),
      score: _deserializeDouble(json['score']),
      kind: _deserializeAnimeKind(json['kind']),
      status: _deserializeAnimeStatus(json['status']),
      episodesCount: json['episodes'],
      rating: _deserializeAnimeRating(json['rating']),
      genres: _deserializeGenres(json['genres']),
      // TODO(Marat): Implement studios deserialization
      studios: const [],
      airedOn: _deserializeDate(json['aired_on']),
      releasedOn: _deserializeDate(json['released_on']),
      description: json['description'],
    );
  }

  String _deserializePreviewPosterUrl(Json imageJson) {
    return _deserializePosterUrl(imageJson, 'preview');
  }

  String _deserializeOriginalPosterUrl(Json imageJson) {
    return _deserializePosterUrl(imageJson, 'original');
  }

  String _deserializePosterUrl(Json imageJson, String quality) {
    return 'https://${_Endpoints.authority}${imageJson[quality]}';
  }

  AnimeKind _deserializeAnimeKind(String source) {
    switch (source) {
      case 'tv':
        return AnimeKind.tv;
      case 'movie':
        return AnimeKind.movie;
      case 'ova':
        return AnimeKind.ova;
      case 'ona':
        return AnimeKind.ona;
      case 'special':
        return AnimeKind.special;
      case 'music':
        return AnimeKind.music;
    }

    throw UnsupportedError('Unsupported anime kind: `$source`');
  }

  AnimeStatus _deserializeAnimeStatus(String source) {
    switch (source) {
      case 'anons':
        return AnimeStatus.anons;
      case 'ongoing':
        return AnimeStatus.ongoing;
      case 'released':
        return AnimeStatus.released;
    }

    throw UnsupportedError('Unsupported anime status: `$source`');
  }

  Rating? _deserializeAnimeRating(String source) {
    switch (source) {
      case 'g':
        return Rating.g;
      case 'pg':
        return Rating.pg;
      case 'pg_13':
        return Rating.pg13;
      case 'r':
        return Rating.r;
      case 'nc_17':
        return Rating.nc17;
      case 'none':
        return null;
    }

    throw UnsupportedError('Unsupported anime rating: `$source`');
  }

  List<AnimeGenre> _deserializeGenres(Iterable<Json> jsons) {
    return jsons.map(_deserializeGenre).toList(growable: false);
  }

  AnimeGenre _deserializeGenre(Json json) {
    return AnimeGenre(
      id: json['id'],
      name: json['name'],
    );
  }

  double _deserializeDouble(String source) {
    return double.parse(source);
  }

  DateTime? _deserializeDate(String? source) {
    return source == null ? null : DateTime.parse(source);
  }
}
