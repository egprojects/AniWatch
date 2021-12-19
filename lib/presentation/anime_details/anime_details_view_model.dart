import 'package:flutter/widgets.dart' show ChangeNotifier;

import '/domain/services/anime/anime_service.dart';
import '/internal/navigation/root/root_app_navigation_service.dart';

class AnimeDetailsViewModel extends ChangeNotifier {
  AnimeDetailsViewModel({
    required int id,
    required AnimeService animeService,
    required RootAppNavigationService rootNavigationService,
  })  : _animeService = animeService,
        _rootNavigationService = rootNavigationService {
    _getAnimeDetails(id);
  }

  final AnimeService _animeService;
  final RootAppNavigationService _rootNavigationService;
  bool _isLoading = false;
  bool _hasErrorGettingAnimeDetails = false;

  late final AnimeDetails animeDetails;
  bool get isLoading => _isLoading;
  bool get hasErrorGettingAnimeDetails => _hasErrorGettingAnimeDetails;

  Future<void> _getAnimeDetails(int id) async {
    _isLoading = true;
    try {
      animeDetails = await _animeService.getAnimeDetails(id);
    } on Error {
      _hasErrorGettingAnimeDetails = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void onPlayPressed() {
    _rootNavigationService.openPlayer(
      id: 0,
    );
  }
}
