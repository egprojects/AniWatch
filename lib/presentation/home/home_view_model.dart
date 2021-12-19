import 'dart:collection';

import 'package:flutter/foundation.dart' show ChangeNotifier;

import '/domain/services/anime/anime_service.dart';
import '/internal/navigation/tab/tab_app_navigation_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required AnimeService animeService,
    required TabAppNavigationService tabNavigationService,
  })  : _animeService = animeService,
        _tabNavigationService = tabNavigationService {
    _getLatestReleases();
  }

  final AnimeService _animeService;
  final TabAppNavigationService _tabNavigationService;
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
      _latestReleases = await _animeService.getLatestReleases(
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
