import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';
import '../widgets/navigation_tab.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationTab(
      key: ValueKey(1),
      routeName: navigation.searchRouteName,
    );
  }
}
