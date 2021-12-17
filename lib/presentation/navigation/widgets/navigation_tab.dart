import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';

class NavigationTab extends StatelessWidget {
  const NavigationTab({
    required this.initialRoute,
    Key? key,
  }) : super(key: key);

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: initialRoute,
      onGenerateInitialRoutes: _onGenerateInitialRoutes,
      onGenerateRoute: navigation.onGenerateRoute,
      onUnknownRoute: navigation.onUnknownRoute,
      // TODO: report route update to engine on active tab
      reportsRouteUpdateToEngine: false,
    );
  }

  List<Route<dynamic>> _onGenerateInitialRoutes(
    NavigatorState navigator,
    String routeName,
  ) {
    final RouteSettings routeSettings = RouteSettings(name: routeName);
    final Route<dynamic>? route = navigation.onGenerateRoute(routeSettings);

    if (route == null) {
      throw ArgumentError.value(
        routeName,
        'routeName',
        'Unknown route name',
      );
    }

    return [route];
  }
}
