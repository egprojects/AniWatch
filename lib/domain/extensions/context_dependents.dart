import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextDependents on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
  CardTheme get cardTheme => CardTheme.of(this);
  ThemeData get theme => Theme.of(this);
  NavigatorState get navigator => Navigator.of(this);
}
