import '/domain/extensions/context_dependents.dart';
import '/presentation/home/home_view.dart';
import '/presentation/home/home_view_model.dart';
import '/presentation/widgets/widgets.dart';
import 'navigation_view_model.dart';
import 'selectors/navigation_selectors.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        animeRepository: context.read(),
      ),
      child: const HomeView(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationCurrentTabIndexSelector(
      builder: (context, currentTabIndex, ___) {
        // TODO: replace with Material You `BottomNavigation`
        return BottomNavigationBar(
          onTap: context.read<NavigationViewModel>().onTabTap,
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: _buildItems(context),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _buildItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined),
        activeIcon: const Icon(Icons.home),
        label: context.localizations.homeMainLabel,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search_outlined),
        activeIcon: const Icon(Icons.search),
        label: context.localizations.homeSearchLabel,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.bookmarks_outlined),
        activeIcon: const Icon(Icons.bookmarks),
        label: context.localizations.homeBookmarksLabel,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.download_outlined),
        activeIcon: const Icon(Icons.download),
        label: context.localizations.homeDownloadsLabel,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle_outlined),
        activeIcon: const Icon(Icons.account_circle),
        label: context.localizations.homeProfileLabel,
      ),
    ];
  }
}
