import 'package:provider/provider.dart';

import '/presentation/widgets/widgets.dart';
import '../player_view_model.dart';

class PlayerIsInitializedSelector extends Selector<PlayerViewModel, bool> {
  PlayerIsInitializedSelector({
    required ValueWidgetBuilder<bool> builder,
    Key? key,
  }) : super(
          key: key,
          selector: (context, viewModel) => viewModel.isInitialized,
          builder: builder,
        );
}
