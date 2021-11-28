import 'dart:collection';

import 'package:provider/provider.dart';

import '/domain/extensions/context_dependents.dart';
import '/presentation/widgets/widgets.dart';
import 'home_model.dart';
import 'selectors/home_selectors.dart';
import 'tabs/bookmarks/bookmarks_tab.dart';
import 'tabs/downloads/downloads_tab.dart';
import 'tabs/main/main_tab.dart';
import 'tabs/profile/profile_tab.dart';
import 'tabs/search/search_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final List<Widget> _tabs = UnmodifiableListView([
    _buildMainTab(context),
    const SearchTab(),
    const BookmarksTab(),
    const DownloadsTab(),
    const ProfileTab(),
  ]);

  @override
  Widget build(BuildContext context) {
    return CurrentTabIndexSelector(
      builder: (_, currentTabIndex, ___) {
        return IndexedStack(
          index: currentTabIndex,
          children: _tabs,
        );
      },
    );
  }

  Widget _buildMainTab(BuildContext context) {
    return _buildTabAnimatedSwitcher(
      context,
      tab: ChangeNotifierProvider(
        create: context.read<HomeModel>().createMainTabModel,
        child: const MainTab(),
      ),
    );
  }

  Widget _buildTabAnimatedSwitcher(
    BuildContext context, {
    required Widget tab,
  }) {
    return AnimatedSwitcher(
      duration: kTabScrollDuration,
      child: tab,
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurrentTabIndexSelector(
      builder: (context, currentTabIndex, ___) {
        return Builder(
          builder: (context) {
            // TODO: replace with Material You `BottomNavigation`
            return BottomNavigationBar(
              onTap: context.read<HomeModel>().onTabTapped,
              currentIndex: currentTabIndex,
              type: BottomNavigationBarType.fixed,
              items: _buildItems(context),
            );
          },
        );
      },
    );
  }

  List<BottomNavigationBarItem> _buildItems(
    BuildContext context,
  ) {
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
