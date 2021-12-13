import '/internal/navigation.dart' as navigation;
import '/presentation/widgets/widgets.dart';
import '../widgets/navigation_tab.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationTab(
      key: ValueKey(4),
      routeName: navigation.profileRouteName,
    );
  }
}
