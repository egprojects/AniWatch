import 'package:aniwatch/core/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

import 'anime_catalog_model.dart';

class AnimeCatalog extends StatelessWidget {
  const AnimeCatalog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimeCatalogModel>(
      builder: (_, model, ___) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 9 / 16,
        ),
        itemCount: model.itemCount,
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Theme(
      data: theme.copyWith(
        textTheme: textTheme.copyWith(
          bodyText1: textTheme.bodyText1.copyWith(
            color: textTheme.bodyText1.color.withOpacity(.87),
            fontWeight: FontWeight.w600,
          ),
          bodyText2: textTheme.bodyText2.copyWith(
            color: textTheme.bodyText2.color.withOpacity(.6),
            fontSize: 12,
          ),
        ),
      ),
      child: _AnimeTile(
        anime: Provider.of<AnimeCatalogModel>(context).getAnime(index),
        onTap: () => null,
      ),
    );
  }
}

class _AnimeTile extends StatelessWidget {
  final Anime anime;
  final GestureTapCallback onTap;

  const _AnimeTile({Key key, @required this.anime, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: Image.network(anime.posterUrl, fit: BoxFit.cover),
        ).card(elevation: 2, clipBehavior: Clip.antiAliasWithSaveLayer),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              anime.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyText1,
            ).padding(vertical: 2),
            Row(
              children: [
                Text('${anime.lastEpisode} эп', style: textTheme.bodyText2),
                const Spacer(),
                Icon(
                  Icons.star_border,
                  size: 14,
                  color: theme.iconTheme.color.withOpacity(.6),
                ),
                Text(anime.rating.toString(), style: textTheme.bodyText2),
              ],
            ),
          ],
        ).padding(horizontal: 4),
      ],
    );

    return onTap == null
        ? body
        : InkWell(
            child: body,
            onTap: onTap,
            borderRadius: BorderRadius.circular(4),
          );
  }
}
