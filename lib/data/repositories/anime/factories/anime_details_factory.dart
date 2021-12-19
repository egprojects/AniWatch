import '/data/models/anime_details_data.dart';
import '/domain/models/anime/anime_details.dart';

class AnimeDetailsFactory {
  const AnimeDetailsFactory({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  final String _baseUrl;

  AnimeDetails fromData(AnimeDetailsData data) {
    return AnimeDetails(
      id: data.id,
      titleRu: data.titleRu,
      titleEn: data.titleEn,
      posterUrl: data.posterPath,
      score: data.score,
      titleJp: data.titleJp,
      titleAlternatives: data.titleAlternatives,
      kind: data.kind,
      status: data.status,
      episodesCount: data.episodesCount,
      releasedEpisodesCount: data.releasedEpisodesCount,
      rating: data.rating,
      episodeDuration: data.episodeDuration,
      favoured: data.favoured,
      anons: data.anons,
      ongoing: data.ongoing,
      scoresStats: data.scoresStats,
      watchStatusesStats: data.watchStatusesStats,
      genres: data.genres.map((genreData) {
        return AnimeGenre(
          id: genreData.id,
          name: genreData.name,
        );
      }).toList(growable: false),
      studios: data.studios.map((studioData) {
        return AnimeStudio(
          id: studioData.id,
          name: studioData.name,
          logoUrl: studioData.logoPath,
        );
      }).toList(growable: false),
      videos: data.videos.map((videoData) {
        return AnimeVideo(
          id: videoData.id,
          kind: videoData.kind,
          url: videoData.url,
          posterUrl: videoData.posterUrl,
          name: videoData.name,
        );
      }).toList(growable: false),
      screenshotsPaths: data.screenshotsPaths,
      description: data.description,
      releaseStartDate: data.releaseStartDate == null
          ? null
          : DateTime.parse(data.releaseStartDate!),
      releaseEndDate: data.releaseEndDate == null
          ? null
          : DateTime.parse(data.releaseEndDate!),
      nextEpisodeDate: data.nextEpisodeDate == null
          ? null
          : DateTime.parse(data.nextEpisodeDate!),
      userWatchData: data.userWatchData == null
          ? null
          : AnimeUserWatchData(
              id: data.userWatchData!.id,
              score: data.userWatchData!.score,
              status: data.userWatchData!.status,
              watchedEpisodesCount: data.userWatchData!.watchedEpisodesCount,
              rewatchesCount: data.userWatchData!.rewatchesCount,
            ),
    );
  }
}
