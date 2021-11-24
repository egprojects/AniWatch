import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dependencies.dart';
import 'navigation.dart' as navigation;
import 'theme.dart' as theme;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void run() {
    runApp(DependenciesProvider(
      child: this,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: _onGenerateTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme.light,
      darkTheme: theme.dark,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }

  String _onGenerateTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appTitle;
  }
}
