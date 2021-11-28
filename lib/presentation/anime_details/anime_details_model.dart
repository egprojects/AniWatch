import 'package:flutter/foundation.dart' show ChangeNotifier;

import '/domain/models/anime/anime_details.dart';
import '/domain/repositories/anime_repository.dart';

class AnimeDetailsModel extends ChangeNotifier {
  AnimeDetailsModel({
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
}
