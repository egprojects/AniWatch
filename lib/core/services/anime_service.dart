import '../models/anime.dart';

abstract class AnimeService {
  Stream<Anime> getAnimePreviews(int page);

  Future<Anime> getAnime(String id);
}
