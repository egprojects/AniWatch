import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import 'anime_catalog/anime_catalog.dart';
import 'anime_catalog/anime_catalog_model.dart';

class HomePage extends StatelessWidget {
  static const titles = [
    'Каталог',
    'История',
    'Запланировано',
    'Смотрю',
    'Аккаунт',
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      tabController: PlatformTabController(),
      appBarBuilder: _buildAppBar,
      bodyBuilder: _buildBody,
      items: _buildItems(context),
    );
  }

  PlatformAppBar _buildAppBar(BuildContext context, int index) {
    return PlatformAppBar(
      title: Text(titles[index]),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    return ChangeNotifierProvider<AnimeCatalogModel>(
      create: (_) => AnimeCatalogModel(),
      builder: (_, __) => AnimeCatalog(),
    );
  }

  List<BottomNavigationBarItem> _buildItems(BuildContext context) => [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          title: Text(titles[0]),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text(titles[1]),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          title: Text(titles[2]),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions),
          title: Text(titles[3]),
        ),
        BottomNavigationBarItem(
          icon: Icon(isMaterial(context)
              ? Icons.account_circle
              : CupertinoIcons.person_solid),
          title: Text(titles[4]),
        ),
      ];
}
