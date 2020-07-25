import '../models/anime.dart';

abstract class AnimeService {
  Future<List<Anime>> getAnimeList(int page);

  Future<Anime> getAnime(String id);
}
