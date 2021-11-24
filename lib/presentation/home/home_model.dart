import 'dart:collection';

import 'package:flutter/widgets.dart' show ChangeNotifier, Widget;
import 'package:provider/provider.dart';

import '/domain/repositories/anime_repository.dart';
import 'tabs/bookmarks/bookmarks_tab.dart';
import 'tabs/downloads/downloads_tab.dart';
import 'tabs/main/main_model.dart';
import 'tabs/main/main_tab.dart';
import 'tabs/profile/profile_tab.dart';
import 'tabs/search/search_tab.dart';

class Tab {
  const Tab._(this.index);

  static const main = Tab._(0);
  static const search = Tab._(1);
  static const bookmarks = Tab._(2);
  static const downloads = Tab._(3);
  static const profile = Tab._(4);

  final int index;
}

class HomeModel with ChangeNotifier {
  HomeModel({
    required AnimeRepository animeRepository,
    Tab initialTab = Tab.main,
  })  : _animeRepository = animeRepository,
        _currentTabIndex = initialTab.index;

  final AnimeRepository _animeRepository;
  int _currentTabIndex;
  late final List<Widget> tabs = UnmodifiableListView([
    ChangeNotifierProvider<MainModel>(
      create: (context) => MainModel(
        animeRepository: _animeRepository,
      ),
      child: const MainTab(),
    ),
    const SearchTab(),
    const BookmarksTab(),
    const DownloadsTab(),
    const ProfileTab(),
  ]);

  int get currentTabIndex => _currentTabIndex;

  void onTabTapped(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}
