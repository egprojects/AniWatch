import 'package:provider/provider.dart';

import '/presentation/widgets/widgets.dart';
import '../anime_details_view_model.dart';

class AnimeDetailsIsLoadingSelector
    extends Selector<AnimeDetailsViewModel, bool> {
  AnimeDetailsIsLoadingSelector({
    required ValueWidgetBuilder<bool> builder,
    Key? key,
  }) : super(
          key: key,
          selector: (context, model) => model.isLoading,
          builder: builder,
        );
}
