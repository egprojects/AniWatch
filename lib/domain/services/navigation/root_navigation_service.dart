import 'navigation_service.dart';

export 'navigation_service.dart';

abstract class RootNavigationService extends NavigationService {
  const RootNavigationService({
    required NavigatorKey navigatorKey,
  }) : super(navigatorKey: navigatorKey);

  Future<dynamic> openNavigation();

  Future<dynamic> openPlayer();
}
