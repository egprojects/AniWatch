import '/domain/extensions/context_dependents.dart';
import '/domain/models/anime/anime_preview.dart';
import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(context.localizations.appTitle),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        _buildLatestReleases(context),
        _buildLatestReleases(context),
        _buildLatestReleases(context),
        _buildLatestReleases(context),
      ],
    );
  }

  Widget _buildLatestReleases(BuildContext context) {
    return _buildSection(
      context,
      label: context.localizations.homeMainLatestReleasesLabel,
      child: _buildSectionItemsList(
        context,
        itemCount: context.read<HomeViewModel>().latestReleasesCount,
        itemBuilder: _buildLatestReleasesItem,
      ),
    );
  }

  Widget _buildLatestReleasesItem(BuildContext context, int index) {
    return Selector<HomeViewModel, bool>(
      selector: (context, model) => model.isGettingLatestReleases,
      builder: (context, isGettingLatestReleases, ___) {
        final AnimePreview? anime = isGettingLatestReleases
            ? null
            : context.read<HomeViewModel>().latestReleases[index];

        return isGettingLatestReleases
            ? const AnimeSmallTile(
                anime: null,
                onTap: null,
              )
            : AnimeSmallTile(
                anime: context.read<HomeViewModel>().latestReleases[index],
                onTap: () {
                  navigation.openAnimeDetails(context, id: anime!.id);
                },
              );
      },
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel(
          context,
          label: label,
        ),
        child,
      ],
    );
  }

  Widget _buildSectionLabel(
    BuildContext context, {
    required String label,
  }) {
    return Padding(
      padding: edgeInsetsL8T16R8B4,
      child: Text(
        label,
        style: context.theme.textTheme.subtitle1!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSectionItemsList(
    BuildContext context, {
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    final double cardMarginHorizontal =
        context.cardTheme.margin?.horizontal ?? 8.0;
    const double itemAspectRatio = 16 / 23;
    final double itemWidth = 128.0 + cardMarginHorizontal;
    final double itemHeight = itemWidth / itemAspectRatio;

    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: edgeInsetsH4,
        shrinkWrap: true,
        itemCount: itemCount,
        itemExtent: itemWidth,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
