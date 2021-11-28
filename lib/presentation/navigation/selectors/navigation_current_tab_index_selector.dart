import 'package:flutter/widgets.dart' show Key, ValueWidgetBuilder;
import 'package:provider/provider.dart';

import '../navigation_view_model.dart';

class NavigationCurrentTabIndexSelector
    extends Selector<NavigationViewModel, int> {
  NavigationCurrentTabIndexSelector({
    required ValueWidgetBuilder<int> builder,
    Key? key,
  }) : super(
          key: key,
          selector: (context, viewModel) => viewModel.currentTabIndex,
          builder: builder,
        );
}
