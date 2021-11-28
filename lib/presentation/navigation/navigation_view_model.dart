import 'package:flutter/foundation.dart';

class NavigationViewModel extends ChangeNotifier {
  NavigationViewModel({
    int initialTabIndex = homeTabIndex,
  }) : _currentTabIndex = initialTabIndex;

  static const int homeTabIndex = 0;
  static const int searchTabIndex = 1;
  static const int bookmarksTabIndex = 2;
  static const int downloadsTabIndex = 3;
  static const int profileTabIndex = 4;

  int _currentTabIndex;

  int get currentTabIndex => _currentTabIndex;

  void onTabTap(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}
