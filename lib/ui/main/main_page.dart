import 'dart:ui';

import 'package:anitube/ui/widgets/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'home/home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final useMaterial = isMaterial(context);
    final materialTheme = useMaterial ? Theme.of(context) : null;
    final cupertinoTheme = useMaterial ? null : CupertinoTheme.of(context);
    final selectedItemColor =
        MediaQuery.platformBrightnessOf(context) == Brightness.light
            ? materialTheme?.accentColor ?? cupertinoTheme.primaryColor
            : Colors.white;

    return PlatformTabScaffold(
      tabController: PlatformTabController(),
      bodyBuilder: _buildBody,
      items: _buildItems(),
      materialTabs: (_, __) => MaterialNavBarData(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: materialTheme.unselectedWidgetColor,
      ),
      cupertinoTabs: (_, __) => CupertinoTabBarData(
        activeColor: selectedItemColor,
      ),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    final content = HomePage();
    return CustomScrollView(
      slivers: [
        _buildAppBar(context, index),
        content,
      ],
    );
  }

  Widget _buildAppBar(BuildContext context, int index) {
    return MainAppBar();
  }

  List<BottomNavigationBarItem> _buildItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Главная'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.schedule),
        title: Text('Расписание'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        title: Text('Уведомления'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.video_library),
        title: Text('Библиотека'),
      ),
    ];
  }
}
