import 'package:flutter/widgets.dart' show BuildContext, ChangeNotifier;

import '/domain/repositories/anime_repository.dart';
import 'tabs/main/main_model.dart';

class HomeModel extends ChangeNotifier {
  HomeModel({
    required AnimeRepository animeRepository,
    int initialTabIndex = 0,
  })  : _animeRepository = animeRepository,
        _currentTabIndex = initialTabIndex;

  final AnimeRepository _animeRepository;
  int _currentTabIndex;

  int get currentTabIndex => _currentTabIndex;

  void onTabTapped(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  MainModel createMainTabModel(BuildContext context) {
    return MainModel(
      animeRepository: _animeRepository,
    );
  }
}
