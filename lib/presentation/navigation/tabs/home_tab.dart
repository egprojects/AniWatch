import '/presentation/widgets/widgets.dart';
import 'tab/navigation_tab_view.dart';
import 'tab/navigation_tab_view_model.dart';

import '/domain/services/navigation/tab_navigation_service.dart';
import '/internal/navigation/app_tab_navigation_service.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TabNavigationService>(
          create: _createTabNavigationService,
        ),
        ProxyProvider<TabNavigationService, NavigationTabViewModel>(
          update: _updateNavigationTabViewModel,
        ),
      ],
      child: const NavigationTabView(),
    );
  }

  TabNavigationService _createTabNavigationService(BuildContext context) {
    return AppTabNavigationService(
      navigatorKey: GlobalKey(),
    );
  }

  NavigationTabViewModel _updateNavigationTabViewModel(
    BuildContext context,
    TabNavigationService tabNavigationService,
    ___,
  ) {
    return NavigationTabViewModel(
      initialRoute: tabNavigationService.homeRouteName,
      tabNavigationService: tabNavigationService,
    );
  }
}
