class AnimePreview {
  const AnimePreview({
    required this.id,
    required this.titleRu,
    required this.titleEn,
    required this.posterUrl,
    required this.score,
  });

  final int id;
  final String titleRu;
  final String titleEn;
  final String posterUrl;
  final double score;
}
