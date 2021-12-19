class AnimePreviewData {
  const AnimePreviewData({
    required this.id,
    required this.titleRu,
    required this.titleEn,
    required this.posterPath,
    required this.score,
  });

  final int id;
  final String titleRu;
  final String titleEn;
  final String posterPath;
  final double score;
}
