import 'package:video_player/video_player.dart';

import '/presentation/widgets/widgets.dart';
import 'player_view_model.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VideoPlayer(
        context.read<PlayerViewModel>().controller,
      ),
    );
  }
}
