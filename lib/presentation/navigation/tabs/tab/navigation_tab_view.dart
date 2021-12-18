import '/presentation/widgets/widgets.dart';
import 'navigation_tab_view_model.dart';

class NavigationTabView extends StatelessWidget {
  const NavigationTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationTabViewModel viewModel = context.read();

    return Navigator(
      key: viewModel.navigatorKey,
      initialRoute: viewModel.initialRoute,
      onGenerateInitialRoutes: viewModel.onGenerateInitialRoutes,
      onGenerateRoute: viewModel.onGenerateRoute,
      onUnknownRoute: viewModel.onUnknownRoute,
      // TODO: report route update to engine on active tab
      reportsRouteUpdateToEngine: false,
    );
  }
}
