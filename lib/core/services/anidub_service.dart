import 'package:aniwatch/core/models/anime.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import 'anime_service.dart';

class AnidubService implements AnimeService {
  static const _baseUrl = 'https://online.anidub.com';

  final _client = Dio(BaseOptions(
    baseUrl: _baseUrl,
  ));

  @override
  Future<List<Anime>> getAnimeList(int page) async {
    final data = <Anime>[];
    final response = await _client.get('/anime/page/$page');
    final content = parse(response.data).querySelector('div#dle-content');
    for (final item in content.querySelectorAll('div.th-item')) {
      final thIn = item.querySelector('a.th-in');
      final id = thIn.attributes['href'];
      final anidubTitleData =
          item.querySelector('div.th-title').text.split(' [');
      final title = anidubTitleData[0];
      final lastEpisode = int.parse(anidubTitleData[1].split(' ')[0]);
      var posterUrl =
          thIn.querySelector('div.th-img').children[0].attributes['data-src'];
      if (!posterUrl.contains('https://')) posterUrl = _baseUrl + posterUrl;
      final rating = double.parse(thIn.querySelector('div.th-rating').text);
      data.add(Anime(id, title, posterUrl, lastEpisode, rating));
    }

    return data;
  }

  @override
  Future<Anime> getAnime(String id) {
    return null;
  }
}
