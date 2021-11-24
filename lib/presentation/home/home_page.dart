import '/domain/extensions/context_dependents.dart';
import '/presentation/widgets/widgets.dart';
import 'home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Selector<HomeModel, int>(
      selector: (_, model) => model.currentTabIndex,
      builder: (_, currentTabIndex, ___) {
        return IndexedStack(
          index: currentTabIndex,
          children: context
              .read<HomeModel>()
              .tabs
              .map((tab) => AnimatedSwitcher(
                    duration: kTabScrollDuration,
                    child: tab,
                  ))
              .toList(growable: false),
        );
        // return AnimatedSwitcher(
        //   duration: kTabScrollDuration,
        //   child: currentTab,
        // );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Selector<HomeModel, int>(
      selector: (_, model) => model.currentTabIndex,
      builder: (context, currentTabIndex, ___) {
        return Builder(builder: (context) {
          // TODO: Replace with Material You `BottomNavigation`
          return BottomNavigationBar(
            onTap: context.read<HomeModel>().onTabTapped,
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            items: _buildBottomNavigationBarItems(context),
          );
        });
      },
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(
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
