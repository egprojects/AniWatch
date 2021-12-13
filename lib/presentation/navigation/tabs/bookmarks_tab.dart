import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';
import '../widgets/navigation_tab.dart';

class BookmarksTab extends StatelessWidget {
  const BookmarksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationTab(
      key: ValueKey(2),
      routeName: navigation.bookmarksRouteName,
    );
  }
}
