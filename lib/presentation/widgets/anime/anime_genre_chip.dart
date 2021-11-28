import '../widgets.dart';

class AnimeGenreChip extends StatelessWidget {
  const AnimeGenreChip({
    required this.genre,
    Key? key,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: borderRadius24,
      ),
      child: Padding(
        padding: edgeInsetsH16V4,
        child: _AnimeGenreLabel(
          genre: genre,
        ),
      ),
    );
  }
}

class _AnimeGenreLabel extends StatelessWidget {
  const _AnimeGenreLabel({
    required this.genre,
    Key? key,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Text(
      genre,
      style: Theme.of(context).textTheme.caption!.copyWith(
            color: Colors.white,
          ),
    );
  }
}
