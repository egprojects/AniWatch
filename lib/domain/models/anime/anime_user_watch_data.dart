class AnimeUserWatchData {
  const AnimeUserWatchData({
    required this.id,
    required this.score,
    required this.status,
    required this.watchedEpisodesCount,
    required this.rewatchesCount,
  });

  final int id;
  final int score;
  final String status;
  final int watchedEpisodesCount;
  final int rewatchesCount;
}
