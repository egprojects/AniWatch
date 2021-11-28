import 'package:provider/provider.dart';

import '/presentation/widgets/widgets.dart';
import '../anime_details_model.dart';

class AnimeDetailsIsLoadingSelector extends Selector<AnimeDetailsModel, bool> {
  AnimeDetailsIsLoadingSelector({
    required ValueWidgetBuilder<bool> builder,
    Key? key,
  }) : super(
          key: key,
          selector: (context, model) => model.isLoading,
          builder: builder,
        );
}
