import 'package:anitube/core/models/anime.dart';
import 'package:flutter/material.dart';

class AnimeTile extends StatelessWidget {
  const AnimeTile({
    Key key,
    @required this.anime,
    this.width,
    this.height,
    this.onTap,
  }) : super(key: key);

  final Anime anime;
  final double width, height;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Image.network(anime.posterUrl),
    );
  }
}
