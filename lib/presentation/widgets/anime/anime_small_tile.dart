import '/domain/models/anime/anime_preview.dart';
import '../widgets.dart';

class AnimeSmallTile extends StatelessWidget {
  const AnimeSmallTile({
    Key? key,
    this.anime,
    this.onTap,
  }) : super(key: key);

  final AnimePreview? anime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius24,
      ),
      child: anime == null
          ? const _OnTapListener()
          : _OnTapListener(
              anime: anime,
              onTap: onTap,
            ),
    );
  }
}

class _OnTapListener extends StatelessWidget {
  const _OnTapListener({
    Key? key,
    this.anime,
    this.onTap,
  }) : super(key: key);

  final AnimePreview? anime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: anime == null ? null : () => onTap?.call(),
      borderRadius: borderRadius24,
      child: anime == null
          ? const _Content()
          : _Content(
              anime: anime,
            ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    this.anime,
  }) : super(key: key);

  final AnimePreview? anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: anime == null
          ? const [
              _PosterPlaceholder(),
              _TitleBox(),
            ]
          : [
              _Poster(url: anime!.posterUrl),
              _TitleBox(title: anime!.title),
            ],
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({
    required this.url,
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: borderRadius24,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _PosterPlaceholder extends StatelessWidget {
  const _PosterPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: AwPlaceholder(),
    );
  }
}

class _TitleBox extends StatelessWidget {
  const _TitleBox({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsH16V2,
      child: Builder(
        builder: (context) {
          return DefaultTextStyle(
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: Theme.of(context).textTheme.subtitle2!,
            child: title == null ? const AwPlaceholder.text() : Text(title!),
          );
        },
      ),
    );
  }
}
