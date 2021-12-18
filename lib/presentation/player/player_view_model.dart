import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:video_player/video_player.dart';

const _videoUrl = 'https://flutter.github.io'
    '/assets-for-api-docs'
    '/assets'
    '/videos'
    '/bee.mp4';

class PlayerViewModel extends ChangeNotifier {
  PlayerViewModel() {
    _initializeController();
  }

  late VideoPlayerController _controller;

  VideoPlayerController get controller => _controller;
  bool get isInitialized => _controller.value.isInitialized;

  Future<void> _initializeController() {
    _controller = VideoPlayerController.network(_videoUrl);
    return _controller.initialize().then((_) {
      _controller.play();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
