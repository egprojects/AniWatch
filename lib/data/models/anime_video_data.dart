class AnimeVideoData {
  const AnimeVideoData({
    required this.id,
    required this.kind,
    required this.url,
    required this.posterUrl,
    required this.name,
  });

  final int id;
  final String kind;
  final String url;
  final String posterUrl;
  final String? name;
}
