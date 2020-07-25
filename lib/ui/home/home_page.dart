import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      tabController: PlatformTabController(),
      bodyBuilder: _buildBody,
      items: _buildItems(context),
    );
  }

  Widget _buildBody(BuildContext context, int index) {
    return Scaffold();
  }

  List<BottomNavigationBarItem> _buildItems(BuildContext context) => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          title: Text('Каталог'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('История'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          title: Text('Запланировано'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions),
          title: Text('Смотрю'),
        ),
        BottomNavigationBarItem(
          icon: Icon(isMaterial(context)
              ? Icons.account_circle
              : CupertinoIcons.person),
          title: const Text('Аккаунт'),
        ),
      ];
}
