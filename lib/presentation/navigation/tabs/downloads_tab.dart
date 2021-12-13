import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';
import '../widgets/navigation_tab.dart';

class DownloadsTab extends StatelessWidget {
  const DownloadsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationTab(
      key: ValueKey(3),
      routeName: navigation.downloadsRouteName,
    );
  }
}
