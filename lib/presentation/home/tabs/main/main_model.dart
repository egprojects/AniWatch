import 'dart:collection';

import '/domain/models/anime/anime_preview.dart';
import '/domain/repositories/anime_repository.dart';
import '/presentation/widgets/widgets.dart';

class MainModel with ChangeNotifier {
  MainModel({
    required AnimeRepository animeRepository,
  }) : _animeRepository = animeRepository {
    _getLatestReleases();
  }

  final AnimeRepository _animeRepository;
  late final List<AnimePreview> _latestReleases;
  bool _isGettingLatestReleases = false;
  bool _hasErrorGettingLatestReleases = false;

  final int latestReleasesCount = 15;
  List<AnimePreview> get latestReleases =>
      UnmodifiableListView(_latestReleases);
  bool get isGettingLatestReleases => _isGettingLatestReleases;
  bool get hasErrorGettingLatestReleases => _hasErrorGettingLatestReleases;

  void _getLatestReleases() async {
    try {
      _isGettingLatestReleases = true;
      _latestReleases = await _animeRepository.getLatestReleases(
        latestReleasesCount,
      );
    } on Error {
      _hasErrorGettingLatestReleases = true;
    } finally {
      _isGettingLatestReleases = false;
      notifyListeners();
    }
  }
}
