import '/domain/extensions/context_dependents.dart';
import '/presentation/widgets/widgets.dart';
import 'selectors/anime_details_selectors.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        padding: edgeInsetsB16,
        children: [
          _buildTopBar(context),
          spacerH32,
          _buildScoreAndRating(context),
          spacerH32,
          _buildDetails(context),
          spacerH32,
          _buildStoryline(context),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: ClipRRect(
        borderRadius: borderRadiusB24,
        child: Stack(
          children: [
            _buildFrames(context),
            _buildTopBarInfo(context),
            if (context.navigator.canPop()) _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFrames(BuildContext context) {
    return AnimeDetailsIsLoadingSelector(
      builder: (context, isLoading, ___) {
        return isLoading
            ? const AwPlaceholder(
                borderRadius: null,
              )
            : PageView.builder(
                itemCount: 3,
                itemBuilder: _buildFrame,
              );
      },
    );
  }

  Widget _buildFrame(BuildContext context, int index) {
    return Image.asset(
      'assets/images/HowToTrainYourDragon.jpeg',
      fit: BoxFit.cover,
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: edgeInsetsH32V24,
        child: BackButton(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTopBarInfo(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 1],
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: edgeInsetsH32V24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBarTextInfo(context),
                spacerW16,
                _buildWatchButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBarTextInfo(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          spacerH24,
          _buildEpisodesInfo(context),
          spacerH8,
          _buildGenres(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline5!.copyWith(
            color: Colors.white,
          ),
      child: AnimeDetailsIsLoadingSelector(
        builder: (context, isLoading, ___) {
          return isLoading
              ? const AwPlaceholder.text(
                  textMaxLines: 2,
                )
              : RichText(
                  text: TextSpan(
                    text: 'How to Train Your Dragon: The Hidden World',
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: ' (2019)',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.white60,
                            ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget _buildEpisodesInfo(BuildContext context) {
    return DefaultTextStyle(
      maxLines: 1,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: Colors.white60,
          ),
      child: Row(
        children: [
          _buildEpisodesCount(context),
          spacerW8,
          _buildEpisodesDuration(context),
        ],
      ),
    );
  }

  Widget _buildEpisodesCount(BuildContext context) {
    return Expanded(
      child: AnimeDetailsIsLoadingSelector(
        builder: (context, isLoading, ___) {
          return isLoading
              ? const AwPlaceholder.text(
                  width: 96,
                )
              : const Text('24 episodes');
        },
      ),
    );
  }

  Widget _buildEpisodesDuration(BuildContext context) {
    return Expanded(
      child: AnimeDetailsIsLoadingSelector(
        builder: (context, isLoading, ___) {
          return isLoading
              ? const AwPlaceholder.text(
                  width: 64,
                )
              : const Text('24min');
        },
      ),
    );
  }

  Widget _buildGenres(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        AnimeGenreChip(genre: 'Animation'),
        AnimeGenreChip(genre: 'Action'),
        AnimeGenreChip(genre: 'Adventure'),
        AnimeGenreChip(genre: 'Animation'),
        AnimeGenreChip(genre: 'Action'),
        AnimeGenreChip(genre: 'Adventure'),
      ],
    );
  }

  Widget _buildWatchButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.play_arrow),
    );
  }

  Widget _buildScoreAndRating(BuildContext context) {
    return Row(
      children: [
        _buildScore(context),
        _buildRating(context),
      ],
    );
  }

  Widget _buildScore(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _buildScoreValue(context),
          _buildScoreLabel(context),
        ],
      ),
    );
  }

  Widget _buildScoreValue(BuildContext context) {
    return _buildScoreOrRatingValue(
      context,
      value: '7.6/10',
    );
  }

  Widget _buildScoreLabel(BuildContext context) {
    return _buildScoreOrRatingLabel(
      context,
      label: 'Score',
    );
  }

  Widget _buildRating(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _buildRatingValue(context),
          _buildRatingLabel(context),
        ],
      ),
    );
  }

  Widget _buildRatingValue(BuildContext context) {
    return _buildScoreOrRatingValue(
      context,
      value: '17+',
    );
  }

  Widget _buildRatingLabel(BuildContext context) {
    return _buildScoreOrRatingLabel(
      context,
      label: 'Rating',
    );
  }

  Widget _buildScoreOrRatingValue(
    BuildContext context, {
    required String value,
  }) {
    return Text(
      value,
      style: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _buildScoreOrRatingLabel(
    BuildContext context, {
    required String label,
  }) {
    return Text(
      label,
      style: Theme.of(context).textTheme.caption,
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: edgeInsetsH16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextDetails(context),
          _buildPoster(context),
        ],
      ),
    );
  }

  Widget _buildTextDetails(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDate(context),
        spacerH16,
        _buildStudio(context),
        spacerH16,
        _buildAuthor(context),
        spacerH16,
        _buildDirector(context),
      ],
    );
  }

  Widget _buildDate(BuildContext context) {
    return _buildTextDetail(
      context,
      label: 'Release date',
      value: 'January 9, 2019',
    );
  }

  Widget _buildStudio(BuildContext context) {
    return _buildTextDetail(
      context,
      label: 'Studio',
      value: 'Bones',
    );
  }

  Widget _buildAuthor(BuildContext context) {
    return _buildTextDetail(
      context,
      label: 'Author',
      value: 'Cressida Cowell',
    );
  }

  Widget _buildDirector(BuildContext context) {
    return _buildTextDetail(
      context,
      label: 'Director',
      value: 'Dean DeBlois',
    );
  }

  Widget _buildTextDetail(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: Theme.of(context).textTheme.bodyText2,
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    return SizedBox(
      width: 128,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: ClipRRect(
          borderRadius: borderRadius24,
          child: Image.asset(
            'assets/images/HowToTrainYourDragon.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildStoryline(BuildContext context) {
    return Padding(
      padding: edgeInsetsH16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStorylineLabel(context),
          spacerH8,
          _buildStorylineText(context),
        ],
      ),
    );
  }

  Widget _buildStorylineLabel(BuildContext context) {
    return Text(
      'Storyline',
      style: Theme.of(context).textTheme.headline6!,
    );
  }

  Widget _buildStorylineText(BuildContext context) {
    return const Text(
      // ignore: lines_longer_than_80_chars
      'From DreamWorks Animation comes a surprising tale about growing up, finding the courage to face the unknown... and how nothing can ever train you to let go. What began as an unlikely friendship between an adolescent Viking and a fearsome Night Fury dragon has become an epic adventure spanning their lives.',
    );
  }
}
