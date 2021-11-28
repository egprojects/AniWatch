import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../home_model.dart';

class CurrentTabIndexSelector extends Selector<HomeModel, int> {
  CurrentTabIndexSelector({
    required ValueWidgetBuilder<int> builder,
    Key? key,
  }) : super(
          key: key,
          selector: (context, model) => model.currentTabIndex,
          builder: builder,
        );
}
