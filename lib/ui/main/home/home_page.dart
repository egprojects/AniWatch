import 'package:anitube/core/models/anime.dart';
import 'package:anitube/ui/main/home/home_model.dart';
import 'package:anitube/ui/widgets/anime_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      delegate: SliverChildListDelegate.fixed([
        _buildLastUpdates(context),
      ]),
      itemExtent: 150,
    );
  }

  Widget _buildSectionName(BuildContext context, String name) {
    final useMaterial = isMaterial(context);
    final materialTheme = useMaterial ? Theme.of(context) : null;
    final cupertinoTheme = useMaterial ? null : CupertinoTheme.of(context);
    var style = materialTheme?.textTheme?.headline6 ??
        cupertinoTheme?.textTheme?.navTitleTextStyle;
    //final color = style.color.withOpacity(.87);
    style = style.copyWith();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        name,
        style: style,
      ),
    );
  }

  Widget _buildLastUpdates(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionName(context, 'Последние'),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Card(
            child: Image.network('https://online.anidub.com/uploads/posts/2020-03/1585660605_maj2.jpg', width: 10,),
          ),
        ),
      ],
    );
  }

  Widget _buildFilms() {
    return Container();
  }

  Widget _buildHistory() {
    return Container();
  }

  Widget _buildPlans() {
    return Container();
  }

  Widget _buildCategories() {
    return Container();
  }
}
