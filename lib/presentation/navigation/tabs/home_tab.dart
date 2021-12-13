import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';
import '../widgets/navigation_tab.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationTab(
      key: ValueKey(0),
      routeName: navigation.homeRouteName,
    );
  }
}
