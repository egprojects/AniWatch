import '/domain/models/user/user_anime_rate.dart';
import 'anime_genre.dart';
import 'anime_kind.dart';
import 'anime_status.dart';
import 'anime_studio.dart';
import 'rating.dart';

export '/domain/models/user/user_anime_rate.dart';
export 'anime_genre.dart';
export 'anime_kind.dart';
export 'anime_status.dart';
export 'anime_studio.dart';
export 'rating.dart';

class AnimeDetails {
  const AnimeDetails({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.score,
    required this.kind,
    required this.status,
    required this.episodesCount,
    required this.genres,
    required this.studios,
    this.airedOn,
    this.releasedOn,
    this.rating,
    this.description,
    this.userRate,
  });

  final int id;
  final String title;
  final String posterUrl;
  final double score;
  final AnimeKind kind;
  final AnimeStatus status;
  final int episodesCount;
  final List<AnimeGenre> genres;
  final List<AnimeStudio> studios;
  final DateTime? airedOn;
  final DateTime? releasedOn;
  final Rating? rating;
  final String? description;
  final UserAnimeRate? userRate;
}
