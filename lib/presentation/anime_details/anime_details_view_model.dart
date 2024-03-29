import 'package:flutter/widgets.dart' show BuildContext, ChangeNotifier;

import '/domain/models/anime/anime_details.dart';
import '/domain/repositories/anime_repository.dart';
import '/internal/navigation.dart' as navigation;

class AnimeDetailsViewModel extends ChangeNotifier {
  AnimeDetailsViewModel({
    required int id,
    required AnimeRepository animeRepository,
  }) : _animeRepository = animeRepository {
    _getAnimeDetails(id);
  }

  final AnimeRepository _animeRepository;
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

  void onPlayPressed(BuildContext context) {
    navigation.openPlayer(context);
  }
}
