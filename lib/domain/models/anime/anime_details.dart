import 'anime_genre.dart';
import 'anime_preview.dart';
import 'anime_studio.dart';
import 'anime_user_watch_data.dart';
import 'anime_video.dart';

export 'anime_genre.dart';
export 'anime_studio.dart';
export 'anime_user_watch_data.dart';
export 'anime_video.dart';

class AnimeDetails extends AnimePreview {
  const AnimeDetails({
    required int id,
    required String titleRu,
    required String titleEn,
    required String posterUrl,
    required double score,
    required this.titleJp,
    required this.titleAlternatives,
    required this.kind,
    required this.status,
    required this.episodesCount,
    required this.releasedEpisodesCount,
    required this.rating,
    required this.episodeDuration,
    required this.favoured,
    required this.anons,
    required this.ongoing,
    required this.scoresStats,
    required this.watchStatusesStats,
    required this.genres,
    required this.studios,
    required this.videos,
    required this.screenshotsPaths,
    required this.description,
    required this.releaseStartDate,
    required this.releaseEndDate,
    required this.nextEpisodeDate,
    required this.userWatchData,
  }) : super(
          id: id,
          titleRu: titleRu,
          titleEn: titleEn,
          posterUrl: posterUrl,
          score: score,
        );

  final String titleJp;
  final List<String> titleAlternatives;
  final String kind;
  final String status;
  final int episodesCount;
  final int releasedEpisodesCount;
  final String rating;
  final int episodeDuration;
  final bool favoured;
  final bool anons;
  final bool ongoing;
  final Map<int, int> scoresStats;
  final Map<String, int> watchStatusesStats;
  final List<AnimeGenre> genres;
  final List<AnimeStudio> studios;
  final List<AnimeVideo> videos;
  final List<String> screenshotsPaths;
  final String? description;
  final DateTime? releaseStartDate;
  final DateTime? releaseEndDate;
  final DateTime? nextEpisodeDate;
  final AnimeUserWatchData? userWatchData;
}
