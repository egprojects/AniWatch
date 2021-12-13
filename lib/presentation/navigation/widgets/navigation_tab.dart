import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';

class NavigationTab extends StatelessWidget {
  const NavigationTab({
    required this.routeName,
    Key? key,
  }) : super(key: key);

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: routeName,
      onGenerateRoute: navigation.onGenerateRoute,
      reportsRouteUpdateToEngine: false,
      observers: [
        HeroController(),
      ],
    );
  }
}
