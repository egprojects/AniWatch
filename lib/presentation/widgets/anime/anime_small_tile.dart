import '/domain/models/anime/anime_preview.dart';
import '../widgets.dart';

class AnimeSmallTile extends StatelessWidget {
  const AnimeSmallTile({
    Key? key,
    required this.anime,
    required this.onTap,
  }) : super(key: key);

  final AnimePreview? anime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius24,
      ),
      child: ChildedBuilder(
        child: _Content(
          anime: anime,
        ),
        builder: (context, content) {
          return _OnTapListener(
            anime: anime,
            onTap: onTap,
            content: content,
          );
        },
      ),
    );
  }
}

class _OnTapListener extends StatelessWidget {
  const _OnTapListener({
    Key? key,
    required this.anime,
    required this.onTap,
    required this.content,
  }) : super(key: key);

  final AnimePreview? anime;
  final VoidCallback? onTap;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: anime == null ? null : () => onTap?.call(),
      borderRadius: borderRadius24,
      child: content,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.anime,
  }) : super(key: key);

  final AnimePreview? anime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Poster(
          posterUrl: anime?.posterUrl,
        ),
        _Title(
          title: anime?.title,
        ),
      ],
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({
    Key? key,
    required this.posterUrl,
  }) : super(key: key);

  final String? posterUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: posterUrl == null
          ? const AwPlaceholder()
          : _PosterContent(
              posterUrl: posterUrl!,
            ),
    );
  }
}

class _PosterContent extends StatelessWidget {
  const _PosterContent({
    Key? key,
    required this.posterUrl,
  }) : super(key: key);

  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: borderRadius24,
        image: DecorationImage(
          image: NetworkImage(posterUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsH16V2,
      child: DefaultTextStyle(
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: Theme.of(context).textTheme.subtitle2!,
        child: title == null ? const AwPlaceholder.text() : Text(title!),
      ),
    );
  }
}
