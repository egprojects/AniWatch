import 'package:flutter/widgets.dart' show ChangeNotifier;

import '/domain/models/anime/anime_details.dart';
import '/domain/repositories/anime_repository.dart';
import '/domain/services/navigation/root_navigation_service.dart';

class AnimeDetailsViewModel extends ChangeNotifier {
  AnimeDetailsViewModel({
    required int id,
    required AnimeRepository animeRepository,
    required RootNavigationService rootNavigationService,
  })  : _animeRepository = animeRepository,
        _rootNavigationService = rootNavigationService {
    _getAnimeDetails(id);
  }

  final AnimeRepository _animeRepository;
  final RootNavigationService _rootNavigationService;
  bool _isLoading = false;
  bool _hasErrorGettingAnimeDetails = false;

  late final AnimeDetails animeDetails;
  bool get isLoading => _isLoading;
  bool get hasErrorGettingAnimeDetails => _hasErrorGettingAnimeDetails;

  Future<void> _getAnimeDetails(int id) async {
    _isLoading = true;
    try {
      await Future<Duration>.delayed(const Duration(seconds: 3));
      animeDetails = await _animeRepository.getAnimeDetails(id);
    } on Error {
      _hasErrorGettingAnimeDetails = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void onPlayPressed() {
    _rootNavigationService.openPlayer();
  }
}
