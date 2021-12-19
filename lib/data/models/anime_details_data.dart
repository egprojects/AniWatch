import 'anime_genre_data.dart';
import 'anime_preview_data.dart';
import 'anime_studio_data.dart';
import 'anime_user_watch_data_data.dart';
import 'anime_video_data.dart';

export 'anime_genre_data.dart';
export 'anime_studio_data.dart';
export 'anime_user_watch_data_data.dart';
export 'anime_video_data.dart';

class AnimeDetailsData extends AnimePreviewData {
  const AnimeDetailsData({
    required int id,
    required String titleRu,
    required String titleEn,
    required String posterPath,
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
          posterPath: posterPath,
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
  final List<AnimeGenreData> genres;
  final List<AnimeStudioData> studios;
  final List<AnimeVideoData> videos;
  final List<String> screenshotsPaths;
  final String? description;
  final String? releaseStartDate;
  final String? releaseEndDate;
  final String? nextEpisodeDate;
  final AnimeUserWatchDataData? userWatchData;
}
