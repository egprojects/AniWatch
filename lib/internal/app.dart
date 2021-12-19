import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'dependencies/app_dependencies.dart';
import 'navigation/root/root_app_navigation_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void run() {
    runApp(AppDependencies(app: this));
  }

  @override
  Widget build(BuildContext context) {
    final AppNavigationService navigationService =
        context.read<RootAppNavigationService>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: _onGenerateTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: navigationService.onGenerateRoute,
      onUnknownRoute: navigationService.onUnknownRoute,
    );
  }

  String _onGenerateTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appTitle;
  }
}
