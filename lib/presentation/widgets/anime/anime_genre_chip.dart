import '../widgets.dart';

class AnimeGenreChip extends StatelessWidget {
  const AnimeGenreChip({
    Key? key,
    required this.genre,
  }) : super(key: key);

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsetsH16V4,
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: borderRadius24,
      ),
      child: Text(
        genre,
        style: Theme.of(context).textTheme.caption!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
