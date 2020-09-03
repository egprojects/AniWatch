import 'package:anitube/ui/widgets/themed_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import 'anime_catalog_model.dart';

class AnimeCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final onSurface = theme.colorScheme.onSurface;
    final onSurface60 = onSurface.withOpacity(.6);
    return Theme(
      data: theme.copyWith(
        textTheme: textTheme.copyWith(
          bodyText1: textTheme.bodyText1.copyWith(
            color: onSurface.withOpacity(.87),
            fontWeight: FontWeight.w600,
          ),
          bodyText2: textTheme.bodyText2.copyWith(
            color: onSurface60,
            fontSize: 12,
          ),
        ),
        iconTheme: theme.iconTheme.copyWith(
          color: onSurface60,
        ),
      ),
      child: _buildGridView(context),
    );
  }

  Widget _buildGridView(BuildContext context) {
    const gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 144,
      crossAxisSpacing: 2,
      childAspectRatio: 9 / 16,
    );
    return isMaterial(context)
        ? SliverGrid(
            delegate: SliverChildBuilderDelegate(_buildItem),
            gridDelegate: gridDelegate,
          )
        : GridView.builder(
            gridDelegate: gridDelegate,
            itemBuilder: _buildItem,
          );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ChangeNotifierProvider<AnimeTileModel>.value(
      value: context.read<AnimeCatalogModel>().getAnime(index),
      child: _AnimeTile(),
    );
  }
}

class _AnimeTile extends StatelessWidget {
  const _AnimeTile({Key key, this.onTap}) : super(key: key);

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: _buildPoster(),
          ),
        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 4),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              Padding(
//                padding: const EdgeInsets.symmetric(vertical: 2),
//                child: _buildTitle(),
//              ),
//              Row(
//                children: [
//                  _buildLastEpisodeName(),
//                  const Spacer(),
//                  Icon(
//                    Icons.star_border,
//                    size: 14,
//                    color: Theme.of(context).iconTheme.color,
//                  ),
//                  _buildRating(),
//                ],
//              ),
//            ],
//          ),
//        ),
      ],
    );

    return onTap == null
        ? body
        : InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(4),
            child: body,
          );
  }

  Widget _buildPoster() {
    return Consumer<AnimeTileModel>(
      builder: (_, model, ___) => model.isLoaded
          ? CachedNetworkImage(
              imageUrl: model.posterUrl,
              fit: BoxFit.cover,
            )
          : Container(),
    );
  }

  Widget _buildTitle() {
    return Consumer<AnimeTileModel>(
      builder: (context, model, ___) => Text(
        model.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _buildLastEpisodeName() {
    return Consumer<AnimeTileModel>(
      builder: (context, model, ___) => model.hasLastEpisodeData
          ? Text(
              model.lastEpisodeName,
              style: Theme.of(context).textTheme.bodyText2,
            )
          : SizedBox.shrink(),
    );
  }

  Widget _buildRating() {
    return Consumer<AnimeTileModel>(
      builder: (context, model, ___) {
        final theme = Theme.of(context);
        var textStyle = theme.textTheme.bodyText2;
        if (!model.isLoaded) {
          textStyle = textStyle.copyWith(color: Colors.transparent);
        }
        Widget rating = Text(
          model?.rating ?? '0.0',
          style: textStyle,
        );
        if (!model.isLoaded) {
          rating = ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ThemedShimmer(
              child: Container(
                color: theme.disabledColor.withOpacity(.6),
                child: rating,
              ),
            ),
          );
        }

        return rating;
      },
    );
  }
}
