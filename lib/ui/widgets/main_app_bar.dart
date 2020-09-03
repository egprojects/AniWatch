import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const productIconData = Icons.subscriptions;
    const title = Text('AniTube');
    return PlatformWidget(
      cupertino: (_, __) => SliverPersistentHeader(
        floating: true,
        delegate: CupertinoMainAppBarDelegate(
          productIconData: productIconData,
          title: title,
        ),
      ),
      material: (_, __) => SliverAppBar(
        floating: true,
        leading: Icon(
          productIconData,
          color: Theme.of(context).accentColor,
        ),
        title: title,
        titleSpacing: -16,
        textTheme: TextTheme(
          headline6: Theme.of(context).primaryTextTheme.headline6.copyWith(
                fontFamily: 'Oswald',
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class CupertinoMainAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CupertinoMainAppBarDelegate({
    @required this.productIconData,
    @required this.title,
  }) : super();

  final IconData productIconData;
  final Widget title;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final navTitleTextStyle =
        CupertinoTheme.of(context).textTheme.navTitleTextStyle;
    return CupertinoNavigationBar(
      leading: Row(
        children: [
          Icon(productIconData),
          DefaultTextStyle(
            style: navTitleTextStyle.copyWith(
              fontFamily: 'Oswald',
              fontSize: 20,
            ),
            child: title,
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;

  @override
  double get maxExtent => 73;

  @override
  double get minExtent => 73;
}
