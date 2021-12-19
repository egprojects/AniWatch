import '/data/models/anime_details_data.dart';
import '/data/models/json.dart';

class AnimeDetailsDataFactory {
  const AnimeDetailsDataFactory._();

  static AnimeDetailsData fromJson(Json json) {
    return AnimeDetailsData(
      id: json['id'],
      titleRu: json['russian'],
      titleEn: json['name'],
      posterPath: json['image']['original'],
      score: json['score'],
      titleJp: json['japanese'][0],
      titleAlternatives: json['synonyms'],
      kind: json['kind'],
      status: json['status'],
      episodesCount: json['episodes'],
      releasedEpisodesCount: json['episodes_aired'],
      rating: json['rating'],
      episodeDuration: json['duration'],
      favoured: json['favoured'],
      anons: json['anons'],
      ongoing: json['ongoing'],
      scoresStats: json['rates_scores_stats'],
      watchStatusesStats: json['rates_statuses_stats'],
      genres: json['genres'],
      studios: json['studios'],
      videos: json['videos'],
      screenshotsPaths: json['screenshots'],
      description: json['description'],
      releaseStartDate: json['aired_on'],
      releaseEndDate: json['released_on'],
      nextEpisodeDate: json['next_episode_at'],
      userWatchData: json['user_rate'],
    );
  }
}
