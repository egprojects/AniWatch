import 'dart:collection';

import 'package:flutter/foundation.dart';

import '/domain/models/anime/anime_preview.dart';
import '/domain/repositories/anime_repository.dart';
import '/domain/services/navigation/tab_navigation_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required AnimeRepository animeRepository,
    required TabNavigationService tabNavigationService,
  })  : _animeRepository = animeRepository,
        _tabNavigationService = tabNavigationService {
    _getLatestReleases();
  }

  final AnimeRepository _animeRepository;
  final TabNavigationService _tabNavigationService;
  late final List<AnimePreview> _latestReleases;
  bool _isGettingLatestReleases = false;
  bool _hasErrorGettingLatestReleases = false;

  final int latestReleasesCount = 15;
  List<AnimePreview> get latestReleases =>
      UnmodifiableListView(_latestReleases);
  bool get isGettingLatestReleases => _isGettingLatestReleases;
  bool get hasErrorGettingLatestReleases => _hasErrorGettingLatestReleases;

  Future<void> _getLatestReleases() async {
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

  void onAnimeTap(int id) {
    _tabNavigationService.openAnimeDetails(id);
  }
}
