import '/internal/navigation/tab/tab_app_navigation_service_impl.dart';
import '/presentation/widgets/widgets.dart';
import 'tab/navigation_tab_view.dart';
import 'tab/navigation_tab_view_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TabAppNavigationService>(
          create: _createTabNavigationService,
        ),
        ProxyProvider<TabAppNavigationService, NavigationTabViewModel>(
          update: _updateNavigationTabViewModel,
        ),
      ],
      child: const NavigationTabView(),
    );
  }

  TabAppNavigationService _createTabNavigationService(BuildContext context) {
    return TabAppNavigationServiceImpl(
      navigatorKey: GlobalKey(),
    );
  }

  NavigationTabViewModel _updateNavigationTabViewModel(
    BuildContext context,
    TabAppNavigationService tabNavigationService,
    ___,
  ) {
    return NavigationTabViewModel(
      initialRoute: tabNavigationService.homeRouteName,
      tabNavigationService: tabNavigationService,
    );
  }
}
