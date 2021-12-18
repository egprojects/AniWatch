import 'package:aniwatch/domain/services/navigation/root_navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/presentation/widgets/widgets.dart';
import 'dependencies.dart';
import 'navigation/app_navigation_service.dart';
import 'theme.dart' as theme;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void run() {
    runApp(
      DependenciesProvider(
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService navigationService =
        context.read<RootNavigationService>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: _onGenerateTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme.light,
      darkTheme: theme.dark,
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: navigationService.onGenerateRoute,
      onUnknownRoute: navigationService.onUnknownRoute,
    );
  }

  String _onGenerateTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appTitle;
  }

  // Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     builder: (context) {
  //       return ChangeNotifierProvider(
  //         create: (context) => NavigationViewModel(),
  //         child: const NavigationView(),
  //       );
  //     },
  //   );
  // }
}
