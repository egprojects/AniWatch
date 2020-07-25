import 'package:aniwatch/core/models/anime.dart';

import 'anime_service.dart';

class AnidubService implements AnimeService {
  @override
  Future<List<Anime>> getAnimeList(int page) {
    return Future.delayed(
        Duration(seconds: 1),
        () => [
              Anime(
                  'Стальной алхимик: Братство',
                  'https://dere.shikimori.one/system/animes/preview/5114.jpg?1594817874',
                  9,
                  8.69),
              Anime(
                  'Врата Штейна',
                  'https://desu.shikimori.one/system/animes/preview/9253.jpg?1594804922',
                  9,
                  8.69),
              Anime(
                  'Стальной алхимик: Братство',
                  'https://dere.shikimori.one/system/animes/preview/5114.jpg?1594817874',
                  9,
                  8.69),
              Anime(
                  'Врата Штейна',
                  'https://desu.shikimori.one/system/animes/preview/9253.jpg?1594804922',
                  9,
                  8.69),
              Anime(
                  'Стальной алхимик: Братство',
                  'https://dere.shikimori.one/system/animes/preview/5114.jpg?1594817874',
                  9,
                  8.69),
              Anime(
                  'Врата Штейна',
                  'https://desu.shikimori.one/system/animes/preview/9253.jpg?1594804922',
                  9,
                  8.69),
              Anime(
                  'Стальной алхимик: Братство',
                  'https://dere.shikimori.one/system/animes/preview/5114.jpg?1594817874',
                  9,
                  8.69),
              Anime(
                  'Врата Штейна',
                  'https://desu.shikimori.one/system/animes/preview/9253.jpg?1594804922',
                  9,
                  8.69),
            ]);
  }

  @override
  Future<Anime> getAnime(String id) {
    return null;
  }
}
