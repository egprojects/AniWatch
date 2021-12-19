import 'package:flutter/widgets.dart' show BuildContext, RouteSettings, Widget;

typedef RouteBuilder<T extends Widget> = T Function(
  BuildContext context,
  RouteSettings settings,
);
